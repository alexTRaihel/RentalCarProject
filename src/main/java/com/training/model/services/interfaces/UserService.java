package com.training.model.services.interfaces;

import com.training.model.domain.User;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.List;

public interface UserService  {

    User getUserByUsername(String username);
    List<User> listUsers();
    void addPerson(User p);
    boolean checkAccess(String username);
}
