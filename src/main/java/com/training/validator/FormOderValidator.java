package com.training.validator;

import com.training.model.domain.Order;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Validator for {@link com.training.model.domain.Order} class,
 * implements {@link Validator} interface.
 *
 * @author Alexie Traihel
 * @version 1.0
 */
public class FormOderValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return Order.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

    }
}
