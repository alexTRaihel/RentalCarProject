package com.training.model.dao.interfaces;

import com.training.model.domain.User;

import java.util.List;

public interface UserDAO   {

//   @Query("select b from user b where b.name = :name")
//   User getUserByName(@Param("name") String name);

   User getUserByUsername(String username);
   List<User> listUsers();
   void addPerson(User p);
   void updateProfile(User user, String password, String email);
   void removePerson(User user);
}
