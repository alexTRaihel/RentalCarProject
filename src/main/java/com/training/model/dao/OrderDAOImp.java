package com.training.model.dao;

import com.training.model.dao.interfaces.OrderDAO;
import com.training.model.domain.Order;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class OrderDAOImp implements OrderDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }

    @Override
    public void saveOrder(Order order) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(order);
    }

    @Override
    public List<Order> getOrdersById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Order where id=:id");
        query.setParameter("id", id);
        //check
        List<Order> orders = (List<Order>) query.list();
        return orders;
    }

    @Override
    public List<Order> findAllOrders() {
        Session session = this.sessionFactory.getCurrentSession();
        return (List<Order>)session.createQuery("from Order").list();
    }

    @Override
    public void updateOrder(Order order) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(order);
    }
}
