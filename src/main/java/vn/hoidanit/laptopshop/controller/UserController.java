package vn.hoidanit.laptopshop.controller;

import org.eclipse.tags.shaded.org.apache.regexp.recompile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UserService;

import java.util.List;;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {

        List<User> arrUsers = userService.getAllUsersByEmail("dinhluong19002004@gmail.com");
        System.out.println(arrUsers);

        model.addAttribute("dinhluong", "test");
        model.addAttribute("luong", "neu em la mot ang may trang");

        return "index";
    }

    @RequestMapping("/admin/create")
    public String getUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUser(Model model, @ModelAttribute("newUser") User user) {
        System.out.println("run here: " + user);
        userService.createUser(user);
        return "index";
    }

    // @RequestMapping(value = "/admin/users", method = RequestMethod.POST)
    // public String getAllUsers(Model model) {
    // model.addAttribute("users", userService.getAllUsers());
    // return "admin/user/getAll";
    // }
}
