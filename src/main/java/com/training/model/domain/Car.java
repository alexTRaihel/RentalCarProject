package com.training.model.domain;

import org.springframework.security.crypto.codec.Base64;

import javax.persistence.*;
import java.io.UnsupportedEncodingException;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "cars", schema = "rental_car")
public class Car {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "model")
    private String model;

    @Column(name = "price")
    private Integer price;

    @Column(name = "description")
    private String description;

    @Column(name = "enabled")
    private Boolean enabled;

    @Lob
    @Column(name = "picture", columnDefinition = "BLOB")
    private byte[] picture;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "car", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Order> orders = new HashSet<Order>();

//    @OneToMany(fetch = FetchType.EAGER, mappedBy = "car_options")
//    private Set<CarOptions> options = new HashSet<CarOptions>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public byte[] getPicture() {
        return picture;
    }

    public void setPicture(byte[] picture) {
        this.picture = picture;
    }

    public Set<Order> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enables) {
        this.enabled = enables;
    }

    @Transient
    private String imgUtility;

    public String getImgUtility() throws UnsupportedEncodingException {
        byte[] encodeBase64 = Base64.encode(getPicture());
        String base64Encoded = new String(encodeBase64, "UTF-8");
        return base64Encoded;
    }
}
