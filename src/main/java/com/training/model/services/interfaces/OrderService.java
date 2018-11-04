package com.training.model.services.interfaces;

import com.training.model.domain.Order;

public interface OrderService {

    int calcRentalPrice(Order order, int priceCar);
}
