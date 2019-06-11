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
    <%--<script src="https://cdn.staticfile.org/jquery/3.4.0/jquery.min.js"></script>--%>
    <%--<script src="https://cdn.staticfile.org/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>--%>
    <script  src="./js/jquery-3.2.1.js"></script>
    <script src="./js/jquery.cookie.js"></script>
</head>
<body>
<div>
    <input type="button" onclick="allmenu()" value="显示菜单">
</div>
</body>
</html>
<script language="JavaScript">
    var menu;
    function getnickname() {
        //name=getCookie("name")
        var name=$.cookie("name")
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
                console.log(data);
                alert("欢迎您，"+data);
                //return data;
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
                console.log(data);
            },
            error: function (e) {
                console.log("错误是:" + e.responseText);
            }
        });
    }
   window.onload=getnickname();
</script>

