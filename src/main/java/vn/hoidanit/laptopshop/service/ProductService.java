package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.repository.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProduct() {
        return productRepository.findAll();
    }

    public Product getProductById(long id) {
        return productRepository.findById(id);
    }

    public Product handleSaveProduct(Product product) {
        return productRepository.save(product);
    }

    public void deleteById(long id) {
        productRepository.deleteById(id);
    }

}
