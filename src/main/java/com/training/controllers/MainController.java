package com.training.controllers;

import com.training.model.domain.User;
import com.training.model.services.interfaces.SecurityService;
import com.training.model.services.interfaces.UserService;
import com.training.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;


@Controller
public class MainController {

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

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String mainPage(Model model, Principal user) {
        model.addAttribute("user", user);
        return "main";
    }

    @RequestMapping(value="/registration", method = RequestMethod.GET)
    public String regist(Model model){
        model.addAttribute("user", new User());
        return "regist";
    }

    @RequestMapping(value= "/registration", method = RequestMethod.POST)
    public String addPerson(@Valid @ModelAttribute("user") User user, BindingResult bindingResult){
        userValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors()){
            return "regist";
        }
        userService.addPerson(user);
        securityService.autoLogin(user.getUsername(), user.getPassword());
        return "redirect:/main";
    }

    @RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error) {
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username or password!");
        }
        model.setViewName("login");
        return model;
    }

    @RequestMapping(value= "/admin/users", method = RequestMethod.GET)
    public String users(Model model){
        List<User> users = userService.listUsers();
        model.addAttribute("listUsers", users);
        return "users";
    }
}
