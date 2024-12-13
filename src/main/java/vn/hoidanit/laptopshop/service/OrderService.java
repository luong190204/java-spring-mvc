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

        Optional<Order> orderOptional = this.orderRepository.findById(id);

        if (orderOptional.isPresent()) {

            Order order = orderOptional.get();

            // lấy ra OrderDetail thông qua Order
            List<OrderDetail> orderDetails = order.getOrderDetails();

            // lặp qua tất cả sản phẩm và tiến hành xóa
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
            // Xóa order
            this.orderRepository.deleteById(id);

        }

    }

}
