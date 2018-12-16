package com.training.model.services.interfaces;

import com.training.model.domain.Order;
import com.training.model.domain.OrderStatus;

import java.util.List;

public interface OrderService {

    int calcRentalPrice(Order order, int priceCar);
    void saveOrder(Order order);
    Order getOrdersById(int id);
    List<Order> findAllOrders();
    boolean doTransfer(Order order);
    void updateOrder(Order order);
}
