package com.training.model.services.interfaces;

import com.training.model.domain.User;

import java.util.List;

public interface UserService  {

    User getUserByUsername(String username);
    List<User> listUsers();
    void addPerson(User p);
}
