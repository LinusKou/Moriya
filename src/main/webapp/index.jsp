<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moriya</title>
    <script src="js/jquery.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
        }
        .top-bar {
            width: 100%;
            height: 50px;
            background-color: #333;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            box-sizing: border-box;
        }
        .top-bar .title {
            font-size: 24px;
        }
        .top-bar .link {
            text-decoration: none;
            color: #fff;
            font-size: 16px;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        h1 {
            margin-bottom: 20px;
        }
        .nav {
            list-style-type: none;
            padding: 0;
        }
        .nav > li {
            margin: 10px 0;
        }
        .nav > li > a {
            text-decoration: none;
            color: #007bff;
        }
        .nav > li > a:hover {
            text-decoration: underline;
        }
        .category {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="top-bar">
    <div class="title">Moriya</div>
    <a href="xss_backend.jsp" class="link">XSS后台</a>
</div>
<div class="container">
    <ul class="nav">
        <li class="category">Brute Force</li>
        <li><a href="brute_force_wp.jsp">弱口令爆破</a></li>
        <li><a href="brute_force_captcha.jsp">弱口令爆破（验证码绕过）</a></li>
        <li class="category">SQL Injection</li>
        <li><a href="SQL_Injection_0.jsp">Level0</a></li>
        <li><a href="SQL_Injection_1.jsp">数字型</a></li>
        <li class="category">Unsafe FileDownload</li>
        <li><a href="fileDownload.jsp">文件下载漏洞</a></li>
        <li class="category">RCE</li>
        <li><a href="ping.jsp">RCE_ping</a></li>
        <li class="category">XXE</li>
        <li><a href="xxe.jsp">XML外部实体注入</a></li>
        <li class="category">XSS</li>
        <li><a href="XSS_store.jsp">存储型XSS</a></li>
    </ul>
</div>
</body>
</html>
