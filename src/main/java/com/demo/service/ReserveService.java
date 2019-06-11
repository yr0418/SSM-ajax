package com.demo.service;

import com.demo.dao.ReserveMapper;
import com.demo.entity.Reserve;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReserveService {
    @Autowired
    ReserveMapper reserveMapper;
    public void insert(Reserve reserve){
        reserveMapper.insert(reserve);
    }

    public List<Reserve> findorder(Reserve reserve){
        return reserveMapper.findorder(reserve);
    }

    public void update(Reserve reserve){
        reserveMapper.update(reserve);
    }
}
