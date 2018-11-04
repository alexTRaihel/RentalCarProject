package com.training.model.services.interfaces;

public interface SecurityService {

    String findLoggedInUsername();
    void autoLogin(String username, String password);
}
