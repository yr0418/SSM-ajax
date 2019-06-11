<%--
  Created by IntelliJ IDEA.
  User: 孤狼
  Date: 2019/5/28
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main</title>
    <script src="https://cdn.staticfile.org/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <script  src="./js/jquery-3.2.1.js"></script>
    <script src="./js/jquery.cookie.js"></script>
</head>
<body>
<div>
    <table id="tab" border="1">
        <tr align="center">
            <th colspan="3">菜单</th>
        </tr>
        <tr align="center">
            <th>序号</th>
            <th>菜名</th>
            <th>价格</th>
        </tr>
    </table>
</div>
<div>
    <h3>创建订单：</h3>
    <p>
        <label>请输入菜名前的序号：</label>
        <input type="text" id="food"/>
    </p>
    <p>
        <label>(不同序号之间用空格隔开)</label>
    </p>
    <p>
        <label>请输入你的地址：</label>
        <input type="text" id="address"/>
    </p>
    <p>
        <input type="button" onclick="getprice()" value="生成订单"/>
    </p>
    <p>
        <input type="button" onclick="toorder()" value="查看订单"/>
    </p>
</div>
</body>
</html>
<script language="JavaScript">
    var menu;
    function getnickname() {
        var name=getCookie("name")
      //  var name=$.cookie("name")
        var user = {
            username: name,
        };
        $.ajax({
            type:"post",
            url:"user/getNickName.action",
            contentType:"application/json",
            data: JSON.stringify(user),
            dataType: "text",
            success:function (data) {
                alert("欢迎您，"+data);
            },
            error:function (e) {
                console.log("错误是:" + e.responseText);
            }
        });
    }
    function getCookie(cname){
        var name=cname+"=";
        var ca=document.cookie.split(';');
        for (var i=0;i<ca.length;i++) {
            var c = ca[i].trim();
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
    }
    function allmenu(){
        $.ajax({
            type: "get",
            url: "menu/findall.action",
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
                menu=data
                var str = "";//定义用于拼接的字符串
                for (var i = 0; i < data.length; i++) {
                    //拼接表格的行和列
                    str = "<tr align='center'><td>" + data[i].id + "</td><td>" + data[i].name + "</td><td>"+data[i].price+"</td></tr>";
                    //追加到table中
                    $("#tab").append(str);
                }
            },
            error: function (e) {
                console.log("错误是:" + e.responseText);
            }
        });
    }
    function getprice(){
        var foods=$("#food").val();
        var reserve={
            food:foods
        };
        $.ajax({
            type:"post",
            url:"menu/getprice.action",
            contentType:"application/json",
            data: JSON.stringify(reserve),
            dataType: "json",
            success:function (data) {
                switch (data) {
                    case 1: alert("请正确输入你要预订的菜品"); document.getElementById("food").value ="";break;
                    default:addYN(data);break;
                }
            },
            error:function (e) {
                console.log("错误是:" + e.responseText);
            }
        });
    }
    function addYN(data){
        if(confirm("总价格为："+data+"元，是否生成订单？")){
            add(data);
        }else {
           alert("取消成功");
        }
    }
    function add(data){
        var price=data;
        var user=getCookie("name");
        var foods=$("#food").val();
        var a=$("#address").val();
        var reserve={
            username:user,
            food:foods,
            sumprice:price,
            address:a
        };
        $.ajax({
            type:"put",
            url:"reserve/insert.action",
            contentType:"application/json",
            data: JSON.stringify(reserve),
            dataType: "json",
            success:function (data) {
                switch (data) {
                    case 1: alert("预订成功");break;
                    default:alert("预订失败");break;
                }
            },
            error:function (e) {
                console.log("错误是:" + e.responseText);
            }
        })
    }
    function toorder(){
        window.location="showorder.jsp";
    }
    window.onload=allmenu();
    window.onload=getnickname();
</script>

