package com.training.controllers;

import com.training.model.domain.Car;
import com.training.model.services.SecurityServiceImpl;
import com.training.model.services.interfaces.CarService;
import com.training.model.services.interfaces.OrderService;
import com.training.model.services.interfaces.UserService;
import com.training.validator.FormOderValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class CarController {

    private static Logger LOG = Logger.getLogger(SecurityServiceImpl.class);

    @Autowired
    private CarService carService;

    @Autowired
    private FormOderValidator formOderValidator;

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/cars", method = RequestMethod.GET)
    public String carsPage(Model model) {
        List<Car> cars = carService.listCars();
        cars = cars.stream().filter(car -> car.getEnabled().equals(true)).collect(Collectors.toList());
        model.addAttribute("listCars", cars);
        return "listCars";
    }

    @RequestMapping(value = "/admin/add/car", method = RequestMethod.GET)
    public String addCar(Model model) {
        Car car = new Car();
        model.addAttribute("car", car);
        return "adminCarEditor";
    }

    @RequestMapping(value = "/admin/add/car", method = RequestMethod.POST)
    public String addCar(@Valid @ModelAttribute("car") Car car,
                         BindingResult bindingResult,
                         @RequestParam("image") MultipartFile file) throws IOException {
        if (bindingResult.hasErrors()){
            return "listCars";
        }
            if(!file.isEmpty()) {
                try {
                    byte[] image = file.getBytes();
                    car.setPicture(image);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if(car.getId()!=null){
            car.setEnabled(true);
            carService.editCar(car);
            }
            else {
            carService.addCar(car);
        }
        return "redirect:/cars";
    }

    @RequestMapping(value = "/admin/edit/{id}", method = RequestMethod.GET)
    public String editCar(@PathVariable("id") int id, ModelMap map) {
        Car car = carService.getCarById(id);
        map.addAttribute("car", car);
        return "adminCarEditor";
    }

    @RequestMapping(value = "/car/{id}", method = RequestMethod.GET)
    public String car(@PathVariable("id") int id, ModelMap map){
        map.addAttribute("car", carService.getCarById(id));
        return "car";
    }

    @RequestMapping(value = "/admin/car/enabled", method = RequestMethod.POST)
    public String pageable(@RequestParam(value = "id") int id) {
        Car car = carService.getCarById(id);
        car.setEnabled(!car.getEnabled());
        carService.editCar(car);
        return "redirect:/car/"+id;
    }

    @RequestMapping(value = "/admin/car/delete", method = RequestMethod.GET)
    public String deleteCar(@RequestParam(value = "id") int id){
        //Change this code
        carService.deleteCar(carService.getCarById(id));
        return "redirect:/cars";
    }

    @RequestMapping(value = "/admin/cars", method = RequestMethod.GET)
    public String listCars(Model model) {
        List<Car> cars = carService.listCars();
        model.addAttribute("listCars", cars);
        return "allCars";
    }

//    @RequestMapping(value = "/cars", method = RequestMethod.GET)
//    public String pageable(Model model, @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC ) Pageable pageable) {
//        Page<Car> cars = carService.getAll(pageable);
//        model.addAttribute("listCars", cars);
//        return "listCars";
//    }

}
