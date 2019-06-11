package com.demo.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Reserve {
    private Long id;

    private String username;

    private String food;

    private double sumprice;

    private String times;

    private String address;

    private String yn;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food == null ? null : food.trim();
    }

    public double getSumprice() {
        return sumprice;
    }

    public void setSumprice(double sumprice) {
        this.sumprice = sumprice;
    }

    public String getTime() {
        return times;
    }

    public void setTime(String times) {
        this.times = times;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getYn() {
        return yn;
    }

    public void setYn(String yn) {
        this.yn = yn == null ? null : yn.trim();
    }
}