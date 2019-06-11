package com.demo.dao;

import com.demo.entity.User;

import java.util.List;

public interface UserMapper {

    void add(User user);

    List<User> findAll();

    User findUser(String username);

    String getNickname(String username);

}