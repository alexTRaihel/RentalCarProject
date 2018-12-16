package com.training.model.domain;

import javax.persistence.*;

@Entity
@Table(name = "car_options", schema = "rental_car")
public class CarOptions {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "option")
    private String option;

//    @ManyToOne (optional = true)
//    @JoinColumn(name = "id")
//    private Car car;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }
}
