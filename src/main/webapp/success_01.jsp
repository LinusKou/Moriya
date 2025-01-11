<%--
  Created by IntelliJ IDEA.
  User: 许文
  Date: 2024/12/23
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Success</title>
</head>
<body>
<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("username") == null) {
        response.sendRedirect("brute_force_captcha.jsp");
        return;
    }
    String username = (String) userSession.getAttribute("username");
%>
<div class="container">
    <h2>Login Successful!</h2>
    <p>Welcome, <%= username %>!</p>
</div>
</body>
</html>

