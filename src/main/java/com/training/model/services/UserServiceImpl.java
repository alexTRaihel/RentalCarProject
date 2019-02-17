package com.training.model.services;

import com.training.model.dao.interfaces.RolesDAO;
import com.training.model.dao.interfaces.UserDAO;
import com.training.model.domain.User;
import com.training.model.services.interfaces.UserService;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

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
        user.setEnabled(true);
        user.setRole(rolesDAO.getByID(1));
        userDaoImp.addUser(user);
    }

    public boolean checkAccess(String username){
        UserDetails userDetails =
                (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(userDetails.getUsername().equals(username)||(userDetails.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN")))){
            return true;
        }
        else return false;
    }

    @Override
    public void updateUser(User user) {
        userDaoImp.updateUser(user);
    }

    @Override
    @Transactional
    public boolean addCount(String username, int count) {
        User user = getUserByUsername(username);
        user.setAccount(user.getAccount()+count);
        updateUser(user);
        return true;
    }

    @Override
    public List<User> getUsersByName(String username) {
        List<User> users = userDaoImp.listUsers();
        users = users.stream().filter(user -> user.getUsername().startsWith(username)).collect(Collectors.toList());
        return users;
    }
}
