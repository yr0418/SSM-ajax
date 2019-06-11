package com.demo.controller;

import com.demo.entity.Menu;
import com.demo.entity.Reserve;
import com.demo.service.MenuService;
import com.demo.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("reserve")
public class ReserveController {
    @Autowired
    ReserveService reserveService;
    @Autowired
    MenuService menuService;

    @RequestMapping(value = "/insert",method = RequestMethod.PUT)
    @ResponseBody
    public int insert(@RequestBody Reserve reserve){
        String foodid[]=reserve.getFood().split(" ");
        String food="";
        List<Menu> list=menuService.findall();
        for (int i = 0; i <foodid.length ; i++) {
            for (int j = 0; j <list.size() ; j++) {
                if(foodid[i].equals(list.get(j).getId().toString())){
                    food=food+list.get(j).getName()+",";
                    break;
                }
            }
        }
        reserve.setFood(food);
        reserve.setYn("未签收");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        reserve.setTime(df.format(new Date()));
        reserveService.insert(reserve);
        return 1;
    }

    @RequestMapping(value = "/findorder",method = RequestMethod.POST)
    @ResponseBody
    public List<Reserve> findorder(@RequestBody Reserve reserve){
        return reserveService.findorder(reserve);
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public int update(@RequestBody Reserve reserve){
        List<Reserve> list=reserveService.findorder(reserve);
        for (int i = 0; i <list.size() ; i++) {
            if(reserve.getId()==list.get(i).getId()){
                reserveService.update(reserve);
                return 1;
            }
        }
        return 0;
    }
}
