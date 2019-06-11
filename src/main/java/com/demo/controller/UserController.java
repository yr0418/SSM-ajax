package com.demo.controller;

import com.demo.entity.Menu;
import com.demo.entity.User;
import com.demo.service.MenuService;
import com.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RequestMapping("user")
@Controller
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    MenuService menuService;

    @RequestMapping(value = "/test1",method = RequestMethod.GET)
    public String firstPage()
    {
        return "test";
    }

    @RequestMapping(value = "/findUser",method = RequestMethod.POST)
    @ResponseBody
    public int findUserByUserName(@RequestBody User user){
        User user1=userService.findUser(user.getUsername());
        if (user1!=null){
            String u1=user1.getPassword();
            String u=user.getPassword();
            if (u1.equals(u)){
                return 0;
            }else {
                return 1;
            }
        }else {
            return 2;
        }
    }

    //使前台正确显示中文字符
    @RequestMapping(value = "/getNickName",produces="text/html;charset=UTF-8;",method =RequestMethod.POST)
    @ResponseBody
    public String getNickname(@RequestBody User user){
        if (user.getUsername()==null){
            return "error";
        }else {
            String nickname=userService.getNickname(user.getUsername());
            if (nickname!=null){
                return nickname;
            }else {
                return "no";
            }
        }
    }
    @RequestMapping(value = "/insertUser",method = RequestMethod.PUT)
    @ResponseBody
    public int insertUser(@RequestBody User user){
        List<User> userList=userService.selectAll();
        for (int i = 0; i <userList.size() ; i++) {
            if(userList.get(i).getUsername().equals(user.getUsername())){
                return 0;
            }
        }
        userService.insertUser(user);
        return 1;
    }
}
