<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Message Board</title>
    <script src="js/jquery.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
        }
        .message-board-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 50%;
        }
        .message-board-container h2 {
            margin-bottom: 20px;
        }
        .message-board-container input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .message-board-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .message-board-container input[type="submit"]:hover {
            background-color: #218838;
        }
        .message {
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            position: relative;
        }
        .message .delete {
            position: absolute;
            top: 10px;
            right: 10px;
            color: red;
            cursor: pointer;
        }
        .result {
            margin-top: 20px;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
<div class="message-board-container">
    <h2>Message Board</h2>
    <form id="messageForm" action="xss_store" method="get">
        <input type="hidden" name="action" value="add">
        <input type="text" name="message" placeholder="Enter your message" required>
        <input type="submit" value="Submit">
    </form>
    <div class="result" id="result">
        <%
            if (session.getAttribute("messages") != null) {
                List<String> messages = (List<String>) session.getAttribute("messages");
                for (int i = 0; i < messages.size(); i++) {
        %>
        <div class="message" id="message_<%=i%>">
            <span><%=messages.get(i)%></span>
            <span class="delete" onclick="deleteMessage(<%=i%>)">&times;</span>
        </div>
        <%
                }
            }
        %>
    </div>
    <div class="error" id="errorMsg"></div>
</div>
<script>
    function deleteMessage(index) {
        $.ajax({
            type: 'GET',
            url: 'xss_store',
            data: { action: 'delete', index: index },
            success: function() {
                $('#message_' + index).remove();
            }
        });
    }
</script>
</body>
</html>
