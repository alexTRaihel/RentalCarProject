package com.training.model.dao;

import com.training.model.dao.interfaces.CarDAO;
import com.training.model.domain.Car;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CarDAOImp implements CarDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }

    @Override
    public Car getCarById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Car> cars = (List<Car>) session.createQuery("from Car").list();
        Car car=null;
        for (Car foundCar : cars) {
            if(foundCar.getId()==id){
                car=foundCar;
            }
        }
        return car;
    }

    @Override
    public List<Car> listCars() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Car> carsList = session.createQuery("from Car").list();
        return carsList;
    }

    @Override
    public void addCar(Car car) {

    }

    @Override
    public void editCar(Car car) {

    }

    @Override
    public void deleteCar(Car car) {

    }
}
