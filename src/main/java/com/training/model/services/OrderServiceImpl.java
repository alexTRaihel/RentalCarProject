package com.training.model.services;

import com.training.model.dao.interfaces.OrderDAO;
import com.training.model.domain.Order;
import com.training.model.domain.OrderStatus;
import com.training.model.domain.User;
import com.training.model.services.interfaces.OrderService;
import com.training.model.services.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private UserService userService;

    private OrderDAO orderDAO;

    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    @Override
    public int calcRentalPrice(Order order, int priceCar) {
        int days = (int)(order.getDataClose().getTime() - order.getDataOpen().getTime())/(24 * 60 * 60 * 1000);
        return priceCar*days;
    }

    @Override
    public void saveOrder(Order order) {
        order.setStatus(OrderStatus.NEW);
        orderDAO.saveOrder(order);
    }

    @Override
    public Order getOrdersById(int id) {
        return orderDAO.getOrdersById(id).stream().findFirst().orElse(null);
    }

    @Override
    public List<Order> findAllOrders() {
        return orderDAO.findAllOrders();
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Transactional
    @Override
    public boolean doTransfer(Order order) {
        User user = order.getUser();
        if (user.getAccount().intValue()>order.getBill().intValue()){
            user.setAccount(user.getAccount().intValue()-order.getBill().intValue());
            userService.updateUser(user);
            return true;
        }

        else {
            return false;
        }
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Override
    public void updateOrder(Order order) {
        orderDAO.updateOrder(order);
    }
}
