package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

import java.util.List;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService,
            UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/user/create") // GET
    public String getUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String getCreateUserPage(Model model,
            @ModelAttribute("newUser") @Valid User user,
            BindingResult newUserBindingResult,
            @RequestParam("dinhluongitFile") MultipartFile file) {

        // Validate
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }
        //

        String avatar = this.uploadService.handSaveUploadFile(file, "avatar");
        String hashPassWord = this.passwordEncoder.encode(user.getPassword());

        user.setAvatar(avatar);
        user.setPassword(hashPassWord);
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));

        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user")
    public String getUsersPage(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users1", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(@PathVariable long id, Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("user1", user);
        model.addAttribute("id", id);

        return "admin/user/detail";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(@PathVariable long id, Model model) {
        User currentUser = userService.getUserById(id);
        model.addAttribute("newUser", currentUser);

        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String getUpdateUserPage(Model model, @ModelAttribute("newUser") User user) {

        User currentUser = userService.getUserById(user.getId());

        if (currentUser != null) {
            currentUser.setFullname(user.getFullname());
            currentUser.setAddress(user.getAddress());
            currentUser.setPhone(user.getPhone());

            userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.deleteUser(user.getId());
        return "redirect:/admin/user";
    }

}
