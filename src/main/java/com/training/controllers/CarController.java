package com.training.controllers;

import com.training.model.domain.Car;
import com.training.model.domain.Order;
import com.training.model.domain.User;
import com.training.model.services.interfaces.CarService;
import com.training.model.services.interfaces.OrderService;
import com.training.model.services.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
public class CarController {

    @Autowired
    private CarService carService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/cars", method = RequestMethod.GET)
    public String carsPage(Model model) {
        List<Car> cars = carService.listCars();
        model.addAttribute("listCars", cars);
        return "listCars";
    }

    @RequestMapping(value = "/rent/{id}", method = RequestMethod.GET)
    public ModelAndView rentalCar(@PathVariable("id") int id) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        //пересмотреть этот код
        User user = userService.getUserByUsername(authentication.getName());

        Car car = carService.getCarById(id);
        ModelAndView model = new ModelAndView();
        model.addObject("order", new Order());
        model.addObject("car", car);
        model.addObject("user", user);
        model.setViewName("formOrder");
        return model;
    }

    @RequestMapping(value= "/rent/{id}", method = RequestMethod.POST)
    public String rentalPage(@PathVariable("id") int id, @Valid @ModelAttribute("order") Order order,@ModelAttribute("car") Car car,
                             BindingResult bindingResult){
        if (bindingResult.hasErrors()){
            return "formOrder";
        }
        Authentication authentication =SecurityContextHolder.getContext().getAuthentication();
        order.setCar(car);
        order.setUser(userService.getUserByUsername(authentication.getName()));
        orderService.saveOrder(order);
        return "redirect:/main";
    }

    @RequestMapping(value= "/admin/orders", method = RequestMethod.GET)
    public String orderConfirmation(Model model){
        List<Order> list = orderService.findAllOrders();
        model.addAttribute("listOrders", list);
        return "listOrders";
    }

    @RequestMapping(value= "/admin/orders", method = RequestMethod.POST)
    public String allOrders(@ModelAttribute("order") Order order, Model model){
        List<Order> list = orderService.findAllOrders();
        model.addAttribute("listOrders", list);
        return "redirect:/admin/orders";
    }

    @RequestMapping(value= "/order/{id}", method = RequestMethod.GET)
    public String order(@PathVariable("id") int id, Model model){
        Order order = orderService.getOrdersById(id);
        if(!(userService.checkAccess(order.getUser().getUsername()))){
            return "redirect:/main";
        }
        model.addAttribute("order", order);
            return "order";
    }


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
//
//    @RequestMapping(value="/failed", method = RequestMethod.GET)
//    public ModelAndView viewFail(){
//        return new ModelAndView("login-failed", "message", "Login-block");
//    }
//
//
//    @RequestMapping(value = "/persons", method = RequestMethod.GET)
//    public String mainPage(Model model) {
//        model.addAttribute("person", new Person());
//        model.addAttribute("mainPage", this.personService.mainPage());
//        return "person";
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
