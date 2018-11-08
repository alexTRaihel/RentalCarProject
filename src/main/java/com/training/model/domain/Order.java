package com.training.model.domain;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "order", schema = "rental_car")
public class Order {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;

    @Column(name = "data_open")
    private Date dataOpen;

    @Column(name = "data_close")
    private Date dataClose;

    @Column(name = "bill")
    private Integer bill;

    @Column(name = "info")
    private String info;

    @Column(name = "passportId")
    private String passportID;

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

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getPassportID() {
        return passportID;
    }

    public void setPassportID(String passportID) {
        this.passportID = passportID;
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
