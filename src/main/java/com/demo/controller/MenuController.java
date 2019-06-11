package com.demo.controller;

import com.demo.entity.Menu;
import com.demo.entity.Reserve;
import com.demo.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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

    @RequestMapping(value = "/getprice",method = RequestMethod.POST)
    @ResponseBody
    public double getprice(@RequestBody Reserve reserve){
        double price=0;
        String foods=reserve.getFood();
        if(foods!=null) {
            String f[] = foods.split(" ");
            List<Menu> list = menuService.findall();
            for (int i = 0; i < f.length; i++) {
                for (int j = 0; j < list.size(); j++) {
                    if (f[i].equals(list.get(j).getId().toString())) {
                        price = price + list.get(j).getPrice();
                        break;
                    }
                    if (j == list.size() - 1 && f[i].equals(list.get(j).getId().toString()) == false) {
                        return 1;
                    }
                }
            }
            return price;
        }else {
            return 1;
        }
    }


}
