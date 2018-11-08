package com.training.model.dao.interfaces;

import com.training.model.domain.Order;

import java.util.List;

public interface OrderDAO {

    void saveOrder(Order order);
    List<Order> getOrdersById(int id);
    List<Order> findAllOrders();
}
