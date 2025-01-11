<%--
  Created by IntelliJ IDEA.
  User: 许文
  Date: 2024/12/23
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login with Captcha</title>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
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
        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .login-container h2 {
            margin-bottom: 20px;
        }
        .login-container input[type="text"], .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .login-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .login-container input[type="submit"]:hover {
            background-color: #218838;
        }
        .captcha-container {
            display: flex;
            align-items: center;
        }
        .captcha-container span {
            margin-left: 10px;
            font-weight: bold;
            font-size: 1.2em;
            user-select: none; /* 禁止用户选择文本 */
        }
        .captcha-container button {
            margin-left: 10px;
            padding: 5px 10px;
            cursor: pointer;
            background-color: #007bff;
            border: none;
            color: #fff;
            border-radius: 3px;
        }
        .captcha-container button:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
        }
    </style>
    <script>
        function generateCaptcha() {
            const captchaText = Math.random().toString(36).substring(2, 8);
            document.getElementById('captchaCode').innerText = captchaText;
            document.getElementById('captchaValue').value = captchaText;
        }

        function validateCaptcha() {
            const enteredCaptcha = document.getElementById('captchaInput').value;
            const captchaValue = document.getElementById('captchaValue').value;
            if (enteredCaptcha !== captchaValue) {
                document.getElementById('captchaErrorMsg').innerText = 'Invalid captcha code.';
                return false;
            }
            return true;
        }

        document.addEventListener('DOMContentLoaded', function() {
            generateCaptcha();
        });
    </script>
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form id="loginForm" action="captcha" method="post" onsubmit="return validateCaptcha()">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <div class="captcha-container">
            <input type="text" id="captchaInput" placeholder="Enter captcha" required>
            <span id="captchaCode"></span>
            <input type="hidden" id="captchaValue" name="captchaValue">
            <button type="button" onclick="generateCaptcha()">Refresh</button>
        </div>
        <input type="submit" value="Login">
        <p class="error" id="captchaErrorMsg"></p>
        <p class="error" id="loginErrorMsg"></p>
    </form>
</div>
<script>
    $(document).ready(function(){
        $('#loginForm').on('submit', function(e){
            e.preventDefault();
            if (validateCaptcha()) {
                $.ajax({
                    type: 'POST',
                    url: 'captcha',
                    data: $(this).serialize(),
                    success: function(response){
                        if(response === 'success'){
                            window.location.href = 'success_01.jsp';
                        } else {
                            $('#loginErrorMsg').text('Invalid username or password.');
                        }
                    }
                });
            }
        });
    });
</script>
</body>
</html>
