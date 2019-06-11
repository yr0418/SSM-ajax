package com.demo.service;

import com.demo.dao.UserMapper;
import com.demo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    UserMapper userMapper;

    public User findUser(String userName){
        return userMapper.findUser(userName);
    }

    public String getNickname(String username) {
        return userMapper.getNickname(username);
    }

    public void insertUser(User user){
         userMapper.add(user);
    }

    public List<User> selectAll(){
        return userMapper.findAll();
    }
}
