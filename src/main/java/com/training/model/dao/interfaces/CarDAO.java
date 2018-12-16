package com.training.model.dao.interfaces;

import com.training.model.domain.Car;
import org.springframework.data.domain.Page;

import java.awt.print.Pageable;
import java.util.List;

public interface CarDAO {

    Car getCarById(int id);
    List<Car> listCars();
    void addCar (Car car);
    void editCar (Car car);
    void deleteCar(Car car);
    Page<Car> getAll(Pageable pageable);
}
