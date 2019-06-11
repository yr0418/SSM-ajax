package com.demo.dao;

import com.demo.entity.Reserve;

import java.util.List;

public interface ReserveMapper {
    void insert(Reserve record);

    List<Reserve> findorder(Reserve reserve);

    void update(Reserve reserve);
}