package com.demo.dao;

import com.demo.entity.Menu;

import java.util.List;

public interface MenuMapper {
   List<Menu> findAll();
}