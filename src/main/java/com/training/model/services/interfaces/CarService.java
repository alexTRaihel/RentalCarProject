package com.training.model.services.interfaces;

import com.training.model.domain.Car;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


import java.util.List;

public interface CarService {
    Car getCarById(int id);
    List<Car> listCars();
    void addCar (Car car);
    void editCar (Car car);
    void deleteCar(Car car);
    Page<Car> getAll(Pageable pageable);
}
