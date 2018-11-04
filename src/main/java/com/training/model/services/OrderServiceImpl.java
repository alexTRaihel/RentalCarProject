package com.training.model.services;

import com.training.model.domain.Order;
import com.training.model.services.interfaces.OrderService;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {

    @Override
    public int calcRentalPrice(Order order, int priceCar) {
        return 0;
    }
}
