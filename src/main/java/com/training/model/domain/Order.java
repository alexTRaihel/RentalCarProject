package com.training.model.domain;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import java.sql.Date;

@Entity
@Table(name = "order", schema = "rental_car")
public class Order {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;

    @NotNull(message = "This field can not be null")
    @Column(name = "data_open")
    private Date dataOpen;

    @NotNull(message = "This field can not be null")
    @Column(name = "data_close", nullable = false)
    private Date dataClose;

    @Column(name = "bill")
    private Integer bill;

    @Column(name = "message")
    private String message;

    @Column(name = "passport")
    private String passport;

    //@ManyToOne (optional = false, cascade = CascadeType.ALL)
    @JoinTable(name = "order_status", joinColumns = @JoinColumn(name = "id"))
    @Enumerated(EnumType.STRING)
    private OrderStatus status;

    @ManyToOne (optional = true)
    @JoinColumn(name = "car_id")
    private Car car;

    @ManyToOne (optional = true)
    @JoinColumn(name = "user_id")
    private User user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDataOpen() {
        return dataOpen;
    }

    public void setDataOpen(Date dataOpen) {
        this.dataOpen = dataOpen;
    }

    public Date getDataClose() {
        return dataClose;
    }

    public void setDataClose(Date dataClose) {
        this.dataClose = dataClose;
    }

    public Integer getBill() {
        return bill;
    }

    public void setBill(Integer bill) {
        this.bill = bill;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String info) {
        this.message = info;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Order that = (Order) o;
        if (id != that.id) return false;
        if (dataOpen != null ? !dataOpen.equals(that.dataOpen) : that.dataOpen != null) return false;
        if (dataClose != null ? !dataClose.equals(that.dataClose) : that.dataClose != null) return false;
        if (bill != null ? !bill.equals(that.bill) : that.bill != null) return false;
        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (dataOpen != null ? dataOpen.hashCode() : 0);
        result = 31 * result + (dataClose != null ? dataClose.hashCode() : 0);
        return result;
    }
}
