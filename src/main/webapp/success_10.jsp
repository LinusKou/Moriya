<%--
  Created by IntelliJ IDEA.
  User: 许文
  Date: 2024/12/23
  Time: 8:32
  To change this template use File | Settings | File Templates.
--%>
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
    response.sendRedirect("SQL_Injection_0.jsp");
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

