package com.demo.controller;

import com.demo.entity.Menu;
import com.demo.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("menu")
@Controller
public class MenuController {
    @Autowired
    MenuService menuService;

    @RequestMapping(value = "/findall",method = RequestMethod.GET)
    @ResponseBody
    public List<Menu> findall(Model model){
        List<Menu> list= menuService.findall();
        return list;
    }


}
