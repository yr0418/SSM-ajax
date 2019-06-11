<%@ page language="java" contentType="text/html; charset=utf-8" %>
<html>
<head>
    <!-- Page title -->
    <title>用户登录</title>
    <!-- End of Page title -->
    <!-- Libraries -->
    <script  src="./js/jquery-3.2.1.js"></script>
    <script src="./js/jquery.cookie.js"></script>
    <!-- End of Libraries -->
</head>
<body>
<div id="container">
    <p>
        <label>用户名: </label>
        <input type="text" id="name" name="name"/>
    </p>
    <P>
        <label>密码: </label>
        <input type="password" id="pwd" name="pwd">
    </P>
    <p>
        <input type="button" onclick="checkLogin()" value="登录"/>
    </p>
    <p>
        <input type="button" onclick="toregister()" value="注册"/>
    </p>
</div>
</body>
</html>
<script type="text/javascript">
    function checkLogin() {
        var uname = $("#name").val();
        var pwd = $("#pwd").val();
       // $.cookie("name",uname, { expires: 7, path: '/', domain: 'jquery.com', secure: true});
        var user = {
            username: uname,
            password: pwd
        };
        $.ajax({
            type:"post",
            url:"user/findUser.action",
            contentType:"application/json",
            data: JSON.stringify(user),
            dataType: "json",
            success: function (data) {
                // console.log(data);
                switch (data) {
                    case 0:
                        setCookie("name",uname);
                        window.location="main.jsp";
                        break;
                    case 1:
                        alert("密码错误，请重新输入!");
                        document.getElementById("pwd").value ="";
                        break;
                    case 2:
                        alert("username wrong!");
                        document.getElementById("name").value ="";
                        document.getElementById("pwd").value ="";
                        break;
                }
            },
            error: function (e) {
                console.log("错误是:" + e.responseText);
            }
        });
    }
    function setCookie(cname,cvalue) {
        var d=new Date();
        d.setTime(d.getTime()+7*24*60*60*1000);
        var expires="expires="+d.toGMTString();
        document.cookie=cname+"="+cvalue+";"+expires;
    }
    function getCookie(cname){
        var name=cname+"=";
        var ca=document.cookie.split(';');
        for (var i=0;i<ca.length;i++){
            var c=ca[i].trim();
            if(c.indexOf(name)==0){
                return c.substring(name.length,c.length);
            }
        }
    }
    function toregister() {
        window.location="register.jsp";
    }
</script>