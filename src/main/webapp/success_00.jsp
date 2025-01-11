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
    response.sendRedirect("brute_force_wp.jsp");
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
