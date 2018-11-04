package com.training.controllers;

import com.training.model.domain.Car;
import com.training.model.domain.Order;
import com.training.model.services.interfaces.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.List;

@Controller
public class CarController {

    @Autowired
    private CarService carService;

    @RequestMapping(value = "/cars", method = RequestMethod.GET)
    public String carsPage(Model model) {
        List<Car> cars = carService.listCars();
        model.addAttribute("listCars", cars);
        return "listCars";
    }

    @RequestMapping(value = "/rent/{id}", method = RequestMethod.GET)
    public String rentalCar(@PathVariable("id") int id, Model model) {
        Car car = carService.getCarById(id);
        Order order = new Order();
        model.addAttribute("order", new Order());
        model.addAttribute("car", car);
        return "order";
    }

    @RequestMapping(value= "/rent/{id}", method = RequestMethod.POST)
    public String rentalPage(@Valid @ModelAttribute("order") Order order,@ModelAttribute("car") Car car, BindingResult bindingResult){
        if (bindingResult.hasErrors()){
            return "order";
        }


//        userService.addPerson(user);
//        securityService.autoLogin(user.getUsername(), user.getPassword());
        return "redirect:/main";
    }
    
//    @RequestMapping(value="/check", method = RequestMethod.POST)
//    public String viewLogin(@Valid @ModelAttribute("user") User user, BindingResult bindingResult, Model model){
//
//        if (bindingResult.hasErrors()){
//            return "login";
//        }
//
//        model.addAttribute("user", user);
//
//        return "main";
//    }
//
//    @RequestMapping(value = "/get-json-user", method = RequestMethod.GET, produces = "application/json")
//    @ResponseBody
//    public User getJsonUser(@RequestParam("name") String name){
//        User user=new User();
//        user.setName(name);
//        return user;
//    }
//
//    @RequestMapping(value = "/put-json-user", method = RequestMethod.POST, consumes = "application/json")
//    public ResponseEntity<String> putJsonUser(@RequestBody User user){
//        System.out.println(user.getName());
//        return new ResponseEntity<String>(HttpStatus.ACCEPTED);
//    }

//    @RequestMapping(value="/check", method = RequestMethod.POST)
//    public ModelAndView viewLogin(@Valid @ModelAttribute User user){
//
//        ModelAndView modelAndView =new ModelAndView();
//        modelAndView.setViewName("main");
//        modelAndView.addObject("user", user);
//
//        return modelAndView;
//    }
//
//
//
//    @RequestMapping(value="/test", method = RequestMethod.GET)
//    public String viewTest(){
//        return "main";
//    }
//
//    @RequestMapping(value="/failed", method = RequestMethod.GET)
//    public ModelAndView viewFail(){
//        return new ModelAndView("login-failed", "message", "Login-block");
//    }
//

//    private PersonService personService;
//
//    @Autowired(required=true)
//    @Qualifier(value="personService")
//    public void setPersonService(PersonService ps){
//        this.personService = ps;
//    }
//
//    @RequestMapping(value = "/persons", method = RequestMethod.GET)
//    public String mainPage(Model model) {
//        model.addAttribute("person", new Person());
//        model.addAttribute("mainPage", this.personService.mainPage());
//        return "person";
//    }
//
//    //For add and update person both
//    @RequestMapping(value= "/person/add", method = RequestMethod.POST)
//    public String addPerson(@ModelAttribute("person") Person p){
//
//        if(p.getId() == 0){
//            //new person, add it
//            this.personService.addPerson(p);
//        }else{
//            //existing person, call update
//            this.personService.updatePerson(p);
//        }
//
//        return "redirect:/persons";
//
//    }
//
//    @RequestMapping("/remove/{id}")
//    public String removePerson(@PathVariable("id") int id){
//
//        this.personService.removePerson(id);
//        return "redirect:/persons";
//    }
//
//    @RequestMapping("/edit/{id}")
//    public String editPerson(@PathVariable("id") int id, Model model){
//        model.addAttribute("person", this.personService.getUserByUsername(id));
//        model.addAttribute("mainPage", this.personService.mainPage());
//        return "person";
//    }



}
