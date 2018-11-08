package com.training.model.services;

import com.training.model.dao.interfaces.OrderDAO;
import com.training.model.domain.Order;
import com.training.model.domain.OrderStatus;
import com.training.model.services.interfaces.OrderService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    private OrderDAO orderDAO;

    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    @Override
    public int calcRentalPrice(Order order, int priceCar) {
        return 0;
    }

    @Override
    public void saveOrder(Order order) {
        order.setStatus(OrderStatus.NEW);
        orderDAO.saveOrder(order);
    }

    @Override
    public Order getOrdersById(int id) {
        Order order = orderDAO.getOrdersById(id).stream().findFirst().orElse(null);
        return order;
    }

    @Override
    public List<Order> findAllOrders() {
        return orderDAO.findAllOrders();
    }
}
