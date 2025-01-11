<%--
  Created by IntelliJ IDEA.
  User: 许文
  Date: 2024/12/24
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ping</title>
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
        .ping-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .ping-container h2 {
            margin-bottom: 20px;
        }
        .ping-container input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .ping-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .ping-container input[type="submit"]:hover {
            background-color: #218838;
        }
        .result {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="ping-container">
    <h2>Ping</h2>
    <form id="pingForm" action="ping" method="post">
        <input type="text" name="ip" placeholder="Enter IP address" required>
        <input type="submit" value="ping">
    </form>
    <div class="result" id="result"></div>
</div>
<script>
    $(document).ready(function(){
        $('#pingForm').on('submit', function(e){
            e.preventDefault();
            $.ajax({
                type: 'POST',
                url: 'ping',
                data: $(this).serialize(),
                success: function(response){
                    $('#result').html(response);
                }
            });
        });
    });
</script>
</body>
</html>
