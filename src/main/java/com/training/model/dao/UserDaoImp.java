package com.training.model.dao;

import com.training.model.dao.interfaces.UserDAO;
import com.training.model.domain.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class UserDaoImp implements UserDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }

    @Override
    public User getUserByUsername(String username) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User where name=:paramName");
        query.setParameter("paramName", username);
        //check
        List<User> users = (List<User>) query.list();

        return users.stream().findFirst().orElse(null);
    }

    @Override
    public void addPerson(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(user);
    }

    @Override
    public void updateProfile(User user, String password, String email) {

    }

    @Override
    public void removePerson(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.delete(user);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> listUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> usersList = session.createQuery("from User").list();
        return usersList;
    }
}