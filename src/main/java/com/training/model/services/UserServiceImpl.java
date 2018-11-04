package com.training.model.services;

import com.training.model.dao.interfaces.RolesDAO;
import com.training.model.dao.interfaces.UserDAO;
import com.training.model.domain.User;
import com.training.model.services.interfaces.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {


    private RolesDAO rolesDAO;

    public void setRolesDAO(RolesDAO rolesDAO) {
        this.rolesDAO = rolesDAO;
    }

    private UserDAO userDaoImp;

    public void setUserDao(UserDAO userDaoImp) {
        this.userDaoImp = userDaoImp;
    }

    @Override
    @Transactional
    public User getUserByUsername(String username) {
        return this.userDaoImp.getUserByUsername(username);
    }

    @Override
    @Transactional
    public List<User> listUsers() {
        return userDaoImp.listUsers();
    }

    @Override
    @Transactional
    public void addPerson(User user) {
        User saveUser = user;
        saveUser.setEnabled(true);
        saveUser.setRole(rolesDAO.getByID(1));
        userDaoImp.addPerson(saveUser);
    }
}
