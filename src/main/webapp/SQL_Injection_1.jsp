<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SQL Injection Union Example</title>
    <script src="js/jquery.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        .query-container, .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin: 10px;
        }
        .query-container h2, .login-container h2 {
            margin-bottom: 20px;
        }
        .query-container select, .login-container input[type="text"], .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .query-container input[type="submit"], .login-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .query-container input[type="submit"]:hover, .login-container input[type="submit"]:hover {
            background-color: #218838;
        }
        .result, .error {
            margin-top: 20px;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
<div class="query-container">
    <h2>查询</h2>
    <form id="queryForm" action="${pageContext.request.contextPath}/SQLI_1" method="post">
        <select name="id">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
        </select>
        <input type="submit" value="Query">
        <div class="result" id="result"></div>
    </form>
</div>
<div class="login-container">
    <h2>Admin Login</h2>
    <form id="loginForm" action="${pageContext.request.contextPath}/SQLI_num_admin" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Login">
        <div class="error" id="loginErrorMsg"></div>
    </form>
</div>
<script>
    $(document).ready(function(){
        $('#queryForm').on('submit', function(e){
            e.preventDefault();
            $.ajax({
                type: 'POST',
                url: 'SQLI_1',
                data: $(this).serialize(),
                success: function(response){
                    $('#result').html(response);
                }
            });
        });

        $('#loginForm').on('submit', function(e){
            e.preventDefault();
            $.ajax({
                type: 'POST',
                url: 'SQLI_num_admin',
                data: $(this).serialize(),
                success: function(response){
                    if(response === 'success'){
                        window.location.href = 'success_11.jsp';
                    } else {
                        $('#loginErrorMsg').text('Invalid username or password.');
                    }
                }
            });
        });
    });
</script>
</body>
</html>
