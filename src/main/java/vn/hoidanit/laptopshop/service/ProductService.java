package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserRepository userRepository;
    private final OrderRepository oderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository,
            CartRepository cartRepository,
            CartDetailRepository cartDetailRepository,
            UserRepository userRepository,
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userRepository = userRepository;
        this.oderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
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

    // save cart
    public void handleAddProductToCart(String email, long productId, HttpSession session) {

        User user = this.userRepository.findByEmail(email);
        // Check user đã có cart chưa ? nếu chưa -> tạo mới
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                // Chưa có => tạo mới
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }

            // Lưu cart_detail
            // Tìm product by id

            Optional<Product> productOptional = Optional.ofNullable(this.productRepository.findById(productId));
            if (productOptional.isPresent()) {
                Product realProduct = productOptional.get();

                // Check sản phẩm đã từng được thêm vào giỏ hàng trước đây chưa?
                CartDetail oldCartDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);

                if (oldCartDetail == null) {

                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(realProduct);
                    cartDetail.setPrice(realProduct.getPrice());
                    cartDetail.setQuantity(1);

                    this.cartDetailRepository.save(cartDetail);

                    // Update cart(sum)
                    int sum = cart.getSum() + 1;
                    cart.setSum(sum);

                    this.cartRepository.save(cart);
                    session.setAttribute("sum", sum);
                } else {
                    oldCartDetail.setQuantity(oldCartDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(oldCartDetail);
                }
            }

        }
    }

    // tìm giỏ hàng tương ứng với user
    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    // Xóa cart-detail
    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {

        // tìm kiếm một đối tượng CartDetail theo ID
        Optional<CartDetail> cartOptional = this.cartDetailRepository.findById(cartDetailId);

        if (cartOptional.isPresent()) {
            // Kiểm tra cart-detail có tồn tại không => get cart-detail
            CartDetail cartDetail = cartOptional.get();

            // Lấy ra cart(giỏ hàng) thông qua cart-detail
            Cart currentCart = cartDetail.getCart();

            // Xóa cart-detail
            this.cartDetailRepository.deleteById(cartDetailId);

            //
            if (currentCart.getSum() > 1) {
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                // Xóa cart nếu sum(số lượng) product bằng 1
                this.cartRepository.deleteById(currentCart.getId());
                // Cập nhật số lượng trong session về 0, là không còn sản phẩm trong giỏ hàng.
                session.setAttribute("sum", 0);
            }
        }

    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentDetail = cdOptional.get();
                currentDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentDetail);
            }
        }
    }

    public void handlePlaceOrder(
            User user, HttpSession session,
            String receiverName,
            String receiverAddress, String receiverPhone) {

        // Create order
        Order order = new Order();
        order.setUser(user);
        order.setReceiverName(receiverName);
        order.setReceiverAddress(receiverAddress);
        order.setReceiverPhone(receiverPhone);
        order = this.oderRepository.save(order);

        // Create orderDetail

        // Step 1: get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }

                // Step 2: delete Cart-detail and cart
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }

                this.cartRepository.deleteById(cart.getId());

                // Step 3: update session
                session.setAttribute("sum", 0);
            }
        }

    }

}
