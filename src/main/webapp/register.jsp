<%--
  Created by IntelliJ IDEA.
  User: 孤狼
  Date: 2019/5/31
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <script  src="./js/jquery-3.2.1.js"></script>
    <script src="./js/jquery.cookie.js"></script>
</head>
<body>
<div>
    <p>
        <label>请输入用户名: </label>
        <input type="text" id="uname" name="name"/>
    </p>
    <p>
        <label>请输入昵称：</label>
        <input type="text" id="nickname" name="nickname">
    </p>
    <P>
        <label>请输入密码: </label>
        <input type="text" id="pwd" name="pwd">
    </P>
    <p>
        <input type="button" onclick="register()" value="注册"/>
    </p>
</div>
</body>
</html>
<script>
    function register() {
        var uname=$("#uname").val();
        console.log(uname);
        var nickname=$("#nickname").val();
        console.log(nickname)
        var pwd=$("#pwd").val();
        console.log(pwd);
        var user={
            username:uname,
            password:pwd,
            nickname:nickname
        };
        console.log(user)
        $.ajax({
            type:"put",
            url:"user/insertUser",
            contentType:"application/json",
            data: JSON.stringify(user),
            dataType: "json",
            success:function (data) {
                switch (data) {
                    case 1:
                        alert("注册成功");break;
                    case 0:
                        alert("该用户名已被使用，请重新注册");
                        document.getElementById("uname").value="";
                        document.getElementById("nickname").value="";
                        document.getElementById("pwd").value="";
                        break;
                }
            },
            error:function (e) {
                console.log(e.responseText)

            }
        });
    }
</script>
