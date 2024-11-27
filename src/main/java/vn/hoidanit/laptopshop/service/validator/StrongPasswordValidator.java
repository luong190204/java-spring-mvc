package vn.hoidanit.laptopshop.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class StrongPasswordValidator implements ConstraintValidator<StrongPassword, String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        // Kiểm tra nếu giá trị null hoặc rỗng
        if (value == null || value.isEmpty()) {
            return false; // Không cho phép giá trị null/rỗng
        }

        // Kiểm tra các điều kiện của mật khẩu mạnh
        return value.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$");
    }
}
