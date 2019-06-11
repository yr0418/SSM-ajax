package com.demo.service;

import com.demo.dao.MenuMapper;
import com.demo.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuService {
    @Autowired
    MenuMapper menuMapper;
    public List<Menu> findall(){
        return menuMapper.findAll();
    }
}
