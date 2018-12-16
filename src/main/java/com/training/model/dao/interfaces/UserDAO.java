package com.training.model.dao.interfaces;

import com.training.model.domain.User;

import java.util.List;

public interface UserDAO   {

//   @Query("select b from user b where b.name = :name")
//   User getUserByName(@Param("name") String name);

   User getUserByUsername(String username);
   List<User> listUsers();
   void addUser(User p);
   void updateUser(User user);
   void removeUser(User user);
   void transfer(User userFrom, User userTo, int amount);
}
