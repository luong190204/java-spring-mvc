package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Order> getAllOrder() {
        return orderRepository.findAll();
    }

    public Optional<Order> getOrderById(long id) {
        return orderRepository.findById(id);
    }

    public void deleteOrderById(long id) {
        orderRepository.deleteById(id);
    }

    public Order handleSaveOrder(Order order) {
        return this.orderRepository.save(order);
    }

    public void handleRemoveCartDetail(long id) {

        // Step 1. Lấy ra đơn hàng của id tương ứng
        Optional<Order> orderOptional = this.orderRepository.findById(id);

        // Step 2. Kiểm tra đơn hàng có trống không ? not null ->
        if (orderOptional.isPresent()) {

            // Lấy ra thông tin của đơn hàng
            Order order = orderOptional.get();

            // lấy ra OrderDetail thông qua Order
            List<OrderDetail> orderDetails = order.getOrderDetails();

            // lặp qua tất cả đơn hàng chi tiết và tiến hành xóa
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
            // Xóa Order sau khi xóa hết OrderDetail
            this.orderRepository.deleteById(id);

        }

    }

}
