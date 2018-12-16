package com.training.model.services;

import com.training.model.dao.interfaces.CarDAO;
import com.training.model.domain.Car;
import com.training.model.services.interfaces.CarService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarServiceImpl implements CarService {

    private CarDAO carDAO;

    public void setCarDAO(CarDAO carDAO) {
        this.carDAO = carDAO;
    }

    @Override
    public Car getCarById(int id) {
        return carDAO.getCarById(id);
    }

    @Override
    public List<Car> listCars() {
        return carDAO.listCars();
    }

    @Override
    public void addCar(Car car) {
        car.setEnabled(true);
        carDAO.addCar(car);
    }

    @Override
    public void editCar(Car car) {
        carDAO.editCar(car);
    }

    @Override
    public void deleteCar(Car car) {
        carDAO.deleteCar(car);
    }

    @Override
    public Page<Car> getAll(Pageable pageable) {
        return null;
    }
}
