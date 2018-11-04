package com.training.model.services.interfaces;

import com.training.model.domain.Car;

import java.util.List;

public interface CarService {
    Car getCarById(int id);
    List<Car> listCars();
    void addCar (Car car);
    void editCar (Car car);
    void deleteCar(Car car);
}
