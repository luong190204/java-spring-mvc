package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.jsp.PageContext;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.service.OrderService;

@Controller
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getPageOrder(Model model, Order order,
            @RequestParam(name = "page", required = false, defaultValue = "1") int page) {

        Pageable pageable = PageRequest.of(page - 1, 2);

        Page<Order> ordersPage = this.orderService.getAllOrder(pageable);
        List<Order> orders = ordersPage.getContent();

        model.addAttribute("orders", orders);
        model.addAttribute("totalPages", ordersPage.getTotalPages());
        model.addAttribute("currentPage", page);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getPageOrderById(@PathVariable long id, Model model) {

        Order order = this.orderService.getOrderById(id).get();
        model.addAttribute("id", id);
        model.addAttribute("orders", order);
        model.addAttribute("orderDetails", order.getOrderDetails());
        return "admin/order/detail";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateProductPage(@PathVariable long id, Model model) {
        Order order = this.orderService.getOrderById(id).get();

        model.addAttribute("newOrder", order);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String getUpdateOrderPage(Model model, @ModelAttribute("newOrder") Order order) {

        Order currentOrder = this.orderService.getOrderById(order.getId()).get();
        if (currentOrder != null) {
            currentOrder.setStatus(order.getStatus());
            orderService.handleSaveOrder(currentOrder);
        }

        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrderPage(Model model, @PathVariable long id) {

        model.addAttribute("id", id);
        model.addAttribute("newOrder", new Order());
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String getDeleteOrderPage(Model model, @ModelAttribute("newOrder") Order order) {

        this.orderService.handleRemoveCartDetail(order.getId());
        return "redirect:/admin/order";

    }
}
