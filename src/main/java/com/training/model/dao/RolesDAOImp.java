package com.training.model.dao;

import com.training.model.dao.interfaces.RolesDAO;
import com.training.model.domain.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Repository
@Transactional
public class RolesDAOImp implements RolesDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }

    @Override
    public Role getByID(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Role> roles = (List<Role>) session.createQuery("from Role").list();
        return roles.stream().findFirst().orElse(null);
    }
}
