<%--
  Created by IntelliJ IDEA.
  User: 许文
  Date: 2024/12/25
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>XXE Example</title>
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
        .xxe-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .xxe-container h2 {
            margin-bottom: 20px;
        }
        .xxe-container textarea {
            width: 100%;
            height: 150px;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: none;
        }
        .xxe-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .xxe-container input[type="submit"]:hover {
            background-color: #218838;
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
<div class="xxe-container">
    <h2>XXE Example</h2>
    <form id="xxeForm" action="xxe" method="post">
        <textarea name="xmlData" placeholder="Enter XML data" required></textarea>
        <input type="submit" value="Submit">
    </form>
    <div class="result" id="result"></div>
    <div class="error" id="errorMsg"></div>
</div>
<script>
    $(document).ready(function(){
        $('#xxeForm').on('submit', function(e){
            e.preventDefault();
            $.ajax({
                type: 'POST',
                url: 'xxe',
                data: $(this).serialize(),
                success: function(response){
                    if (response.startsWith("Error:")) {
                        $('#errorMsg').text(response.substring(6));
                        $('#result').text('');
                    } else {
                        $('#result').html(response);
                        $('#errorMsg').text('');
                    }
                }
            });
        });
    });
</script>
</body>
</html>

