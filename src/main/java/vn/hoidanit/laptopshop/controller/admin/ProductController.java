package vn.hoidanit.laptopshop.controller.admin;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService,
            UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getPageProduct(Model model, Product product) {
        List<Product> products = productService.getAllProduct();
        model.addAttribute("products", products);
        return "/admin/product/show";
    }

    @GetMapping("/admin/product/create") // GET
    public String getProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String getCreateProductPage(Model model,
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newBindingResult,
            @RequestParam("dinhluongitFile") MultipartFile file) {

        // Validate
        List<FieldError> errors = newBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (newBindingResult.hasErrors()) {
            return "admin/product/create";
        }
        //

        String imgProduct = this.uploadService.handSaveUploadFile(file, "product");

        product.setImage(imgProduct);
        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductsDetailPage(@PathVariable long id, Model model, Product product) {
        product = this.productService.getProductById(id);
        var price = product.getPrice();

        DecimalFormat formatter = new DecimalFormat("#,###");
        String formattedPrice = formatter.format(price);

        model.addAttribute("products", product);
        model.addAttribute("id", id);
        model.addAttribute("price", formattedPrice);

        return "admin/product/detail";
    }

}
