package com.training.controllers;

import com.google.gson.Gson;
import com.training.model.domain.User;
import com.training.model.services.SecurityServiceImpl;
import com.training.model.services.interfaces.SecurityService;
import com.training.model.services.interfaces.UserService;
import com.training.validator.UserValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class MainController {

    private static Logger LOG = Logger.getLogger(SecurityServiceImpl.class);
    private final Gson GSON = new Gson();

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private SecurityService securityService;

    private UserService userService;

    @Autowired(required=true)
    @Qualifier(value="userService")
    public void setPersonService(UserService ps){
        this.userService = ps;
    }

    @RequestMapping(value = {"/","/main"}, method = RequestMethod.GET)
    public String mainPage(Model model) {
        return "main";
    }

    @RequestMapping(value="/registration", method = RequestMethod.GET)
    public String registration(Model model){
        model.addAttribute("user", new User());
        return "formRegistration";
    }

    @RequestMapping(value= "/registration", method = RequestMethod.POST)
    public String addPerson(@Valid @ModelAttribute("user") User user, BindingResult bindingResult){
        userValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors()){
            return "formRegistration";
        }
        userService.addPerson(user);
        securityService.autoLogin(user.getUsername(), user.getPassword());
        return "redirect:/main";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error) {
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username or password!");
        }
        model.setViewName("formLogin");
        return model;
    }

    @RequestMapping(value= "/admin/users", method = RequestMethod.GET)
    public String users(Model model){
        List<User> users = userService.listUsers();
        model.addAttribute("listUsers", users);
        return "listUsers";
    }

    @RequestMapping(value= "/profile/{username}", method = RequestMethod.GET)
    public String userProfile(@PathVariable("username") String username, Model model){

        if (!(userService.checkAccess(username))){
            return "redirect:/main";
        }
        User user = userService.getUserByUsername(username);
        model.addAttribute("user", user);
        return "userProfile";
    }

    @RequestMapping(value= "/profile/{username}", method = RequestMethod.POST)
    public String changeUserProfile(@PathVariable("username") String username, @ModelAttribute("user") User user, Model model){
        return "userProfile";
    }

    @RequestMapping(value= "/admin/user/enabled", method = RequestMethod.POST)
    public String lockProfile(@RequestParam("name") String name){
        User user = userService.getUserByUsername(name);
        if (user!=null){
            user.setEnabled(!user.isEnabled());
            userService.updateUser(user);
        }
        return "redirect:/profile/"+name;
    }

    @RequestMapping(value= "/admin/user/topUpAccount", method = RequestMethod.POST)
    public String addMoney(@RequestParam("name") String name, @RequestParam("count") int count){
        User user = userService.getUserByUsername(name);
        if (user!=null){
            userService.addCount(name, count);
        }
        return "redirect:/profile/"+name;
    }

    @RequestMapping(value = "/admin/user/find", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
    @ResponseBody
    public String findUser(@RequestParam("name") String name){
        if (name.isEmpty()){
           return null;
        }
        else {
            List<Map> listResult = new ArrayList<>();
            List<User> users = userService.getUsersByName(name);
            for (User user : users) {
                Map<String, String> map = new HashMap<>();
                map.put("id",user.getId().toString());
                map.put("username", user.getUsername());
                map.put("account", user.getAccount().toString());
                String enabled = user.isEnabled()? "true" : "false";
                map.put("enabled", enabled);
                map.put("role", user.getRole().getRole());
                listResult.add(map);
            }
            return GSON.toJson(listResult);
        }
    }
}
