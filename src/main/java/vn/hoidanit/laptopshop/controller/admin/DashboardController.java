package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class DashboardController {

    private final UserService userService;

    public DashboardController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {

        model.addAttribute("countUser", this.userService.countUsers());
        model.addAttribute("countProduct", this.userService.countProducts());
        model.addAttribute("countOrder", this.userService.countOrders());

        return "admin/dashboard/show";
    }
}
