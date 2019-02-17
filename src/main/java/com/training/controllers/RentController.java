package com.training.controllers;

import com.training.model.domain.Car;
import com.training.model.domain.Order;
import com.training.model.domain.OrderStatus;
import com.training.model.services.SecurityServiceImpl;
import com.training.model.services.interfaces.CarService;
import com.training.model.services.interfaces.OrderService;
import com.training.model.services.interfaces.UserService;
import com.training.validator.FormOderValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class RentController {

    private static Logger LOG = Logger.getLogger(SecurityServiceImpl.class);

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    @Autowired
    private CarService carService;

    @Autowired
    private FormOderValidator formOderValidator;

    @RequestMapping(value= "/admin/orders", method = RequestMethod.GET)
    public String orderConfirmation(Model model){
        List<Order> list = orderService.findAllOrders();
        model.addAttribute("listOrders", list);
        return "listOrders";
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

    @RequestMapping(value= "/approve", method = RequestMethod.POST)
    public String approveOrder(@RequestParam("id") int id){
        Order order = orderService.getOrdersById(id);
        Boolean transfer = orderService.doTransfer(order);
        if (transfer){
            order.setStatus(OrderStatus.CURRENT);
        }
        else {
            order.setStatus(OrderStatus.REJECTED);
            order.setMessage("Not enough money");
        }
        orderService.updateOrder(order);
        return "redirect:/order/"+id;
    }

    @RequestMapping(value= "/reject", method = RequestMethod.POST)
    public String rejectOrder(@RequestParam("id") int id, @RequestParam("message") String message){
        Order order = orderService.getOrdersById(id);
        order.setStatus(OrderStatus.REJECTED);
        order.setMessage(message);
        orderService.updateOrder(order);
        return "redirect:/order/"+id;
    }

    @RequestMapping(value = "/rent/{id}", method = RequestMethod.GET)
    public ModelAndView rentalCar(@PathVariable("id") int id) {
        //To do change this code
        Order order = new Order();
        Car car = carService.getCarById(id);
        ModelAndView model = new ModelAndView();
        model.addObject("order", order);
        model.addObject("car", car);
        model.setViewName("formOrder");
        return model;
    }

//    @RequestParam("selected") List<String> values,

    @RequestMapping(value= "/rent/{id}", method = RequestMethod.POST)
    public String rentalPage(@PathVariable("id") int id,
                             @Valid @ModelAttribute("order") Order order,
                             BindingResult bindingResult,
                             Model model){
        formOderValidator.validate(order,bindingResult);
        Car car = carService.getCarById(id);
        if (bindingResult.hasErrors()){
            model.addAttribute("car", car);
            return "formOrder";
        }
//        values.size();
        order.setCar(car);
        order.setBill(orderService.calcRentalPrice(order, car.getPrice()));
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        order.setUser(userService.getUserByUsername(authentication.getName()));
        orderService.saveOrder(order);
        return "redirect:/main";
    }

    @RequestMapping(value = "/order/close", method = RequestMethod.POST, produces = {"text/html; charset=UTF-8"})
    @ResponseBody
    public ResponseEntity<String> closeOrder(@RequestParam("id") int id, @RequestParam("message") String message){
        Order order = orderService.getOrdersById(id);
        order.setStatus(OrderStatus.CLOSED);
        order.setMessage(message);
        orderService.updateOrder(order);
        return new ResponseEntity<String>(HttpStatus.OK);
    }

    @RequestMapping(value = "/get-json-user/{id}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public String getJsonUser(@PathVariable("id") int id) {
        return "Ivan";
    }
    @RequestMapping(value = "/put-json-user", method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<String> setJsonUser(@RequestBody Order order) {
        LOG.debug(order.getStatus());
        return new ResponseEntity<String>(HttpStatus.OK);
    }
}
