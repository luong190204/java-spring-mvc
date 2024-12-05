package vn.hoidanit.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable Long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable Long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        long productId = id;

        this.productService.handleAddProductToCart(email, productId, session);
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {

        User currentUser = new User();

        // Lấy ra id của người dùng đang đăng nhập
        HttpSession session = request.getSession();
        long id = (long) session.getAttribute("id");

        // gán id vào user
        currentUser.setId(id);

        // Lấy ra giỏ hàng của người dùng đang đăng nhập
        Cart cart = this.productService.fetchByUser(currentUser);

        // Lấy ra chi tiết giỏ hàng của giỏ hàng vừa lấy
        // Đặt điều kiện khi mà cart rỗng thì cho vào 1 array rỗng
        List<CartDetail> cartDetails = cart == null ? new ArrayList<>() : cart.getCartDetails();

        // Đặt điều kiện bằng if else
        // List<CartDetail> cartDetails2;
        // if (cart == null) {
        // cartDetails2 = new ArrayList<>();
        // } else {
        // cartDetails2 = cart.getCartDetails();
        // }

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetail", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);

        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;

        this.productService.handleRemoveCartDetail(cartDetailId, session);

        return "redirect:/cart";
    }

    @PostMapping("/checkout")
    public String getCheckOut(Model model, HttpServletRequest request) {

        User currentUser = new User(); // null

        // Lấy ra id của người dùng đang đăng nhập
        HttpSession session = request.getSession();
        long id = (long) session.getAttribute("id");

        // gán id vào user
        currentUser.setId(id);

        // Lấy ra giỏ hàng của người dùng đang đăng nhập
        Cart cart = this.productService.fetchByUser(currentUser);

        // Lấy ra chi tiết giỏ hàng của giỏ hàng vừa lấy
        // Đặt điều kiện khi mà cart rỗng thì cho vào 1 array rỗng
        List<CartDetail> cartDetails = cart == null ? new ArrayList<>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetail", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);

        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckoutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone) {

        HttpSession session = request.getSession(false);

        return "redirect:/";
    }
}
