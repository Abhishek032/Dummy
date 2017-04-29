<%--
  Created by IntelliJ IDEA.
  User: Abhishek
  Date: 28-04-2017
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .btn:hover { text-decoration: none; background-color: #4686ec; }
        body{
            background:silver;
        }

        h2{
            color:white;
        }

        div.relative{

            position:absolute;
            background-color: #092756;
            border-radius:50px;
            left:235px;
            height:400px;
            width: 700px;
            padding: 50px;
            margin: 50px;
            align: middle;
        }

        a:link {
            text-decoration:  none;
            color: silver;
        }

        a:visited {
            color: silver;
        }

        a:hover {
            color: #4686ec;
        }

        a:active {
            color: silver;
        }
        P{
            color:white;
        }

        input {
            width: 70%;
            margin-bottom: 10px;
            background: rgba(0,0,0,0.3);
            border: none;
            outline: none;
            padding: 10px;
            font-size: 13px;
            color: #fff;
            text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
            border: 1px solid rgba(0,0,0,0.3);
            border-radius: 4px;
            box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
        }

    </style>
    <title>Login Here</title>
</head>
<body>
<div class="relative" align="center">

    <h2>LOGIN TO YOUR CIMBIDIA ACCOUNT</h2><br>
    <form method="get" action="/Login.do">
        <input type="text" placeholder="enter username" name="id"><br><br>
        <input type="password" placeholder="enter password" name="pass"><br><br>
        <input type="submit" class="btn" value="Login">
    </form>
    <p>Forgot your UserName or Password ? <br><a href="#"> Click to reset</a></p>

</div>


</body>
</html>
