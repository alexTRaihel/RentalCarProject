package com.training.validator;

import com.training.model.domain.Order;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import javax.validation.Validation;
import javax.validation.constraints.NotNull;

/**
 * Validator for {@link com.training.model.domain.Order} class,
 * implements {@link Validator} interface.
 *
 * @author Alexie Traihel
 * @version 1.0
 */
@Component
public class FormOderValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return Order.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Order order = (Order) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "passport", "Required");
        if (order.getPassport().length() < 4 || order.getPassport().length() > 8) {
            errors.rejectValue("passport", "Size.user.passport");
        }
    }
}
