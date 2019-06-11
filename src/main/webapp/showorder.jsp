<%--
  Created by IntelliJ IDEA.
  User: 孤狼
  Date: 2019/6/12
  Time: 0:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script  src="./js/jquery-3.2.1.js"></script>
<script src="./js/jquery.cookie.js"></script>
<html>
<head>
    <title>查看订单</title>
</head>
<body>
<div>
    <table id="tab" border="1">
        <tr align="center">
            <th colspan="6">订单</th>
        </tr>
        <tr align="center">
            <th>订单号</th>
            <th>所选菜品</th>
            <th>总价格</th>
            <th>送货地址</th>
            <th>下单时间</th>
            <th>订单状态</th>
        </tr>
    </table>
</div>
<div>
    <h3>签收订单</h3>
    <p>
        <label>请输入订单号：</label>
        <input type="text" id="id" />
    </p>
    <p>
        <input type="button" onclick="update()" value="确认签收"/>
    </p>
</div>
</body>
<script language="JavaScript">
    function getorder() {
        var uname=getCookie("name");
        var reserve={
            username:uname
        };
        $.ajax({
            type:"post",
            url: "reserve/findorder.action",
            contentType: "application/json",
            data: JSON.stringify(reserve),
            dataType: "json",
            success: function (data) {
                console.log(data);
                var str = "";//定义用于拼接的字符串
                for (var i = 0; i < data.length; i++) {
                    //拼接表格的行和列
                    str = "<tr align='center'><td>" + data[i].id + "</td><td>" + data[i].food + "</td><td>"+data[i].sumprice+"</td><td>"+data[i].address+"</td><td>"+data[i].time+"</td><td>"+data[i].yn+"</td></tr>";
                    //追加到table中
                    $("#tab").append(str);
                }
            },
            error: function (e) {
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
    function update(){
        var Id=$("#id").val();
        var uname=getCookie("name");
        var reserve={
            id:Id,
            username:uname
        };
        console.log(reserve);
        $.ajax({
            type:"post",
            url: "reserve/update.action",
            contentType: "application/json",
            data: JSON.stringify(reserve),
            dataType: "json",
            success: function (data) {
                switch (data) {
                    case 1:alert("签收成功");window.location="showorder.jsp";break;
                    case 0:alert("无该订单"); document.getElementById("id").value="";break;
                }
            },
            error: function (e) {
                console.log("错误是:" + e.responseText);
            }
        });
    }
    window.onload=getorder();
</script>
</html>
