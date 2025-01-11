<%--
  Created by IntelliJ IDEA.
  User: 许文
  Date: 2024/12/24
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Image Download</title>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .gallery {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-top: 20px;
        }
        .gallery-item {
            text-align: center;
        }
        .gallery-item img {
            width: 200px;
            height: 165px;
            object-fit: cover;
        }
        .gallery-item a {
            display: block;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }
        .gallery-item a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="gallery">
    <div class="gallery-item">
        <img src="img/Amstrad_CPC464.jpg" alt="Image 1">
        <a href="DownloadServlet?file=Amstrad_CPC464.jpg">Amstrad CPC464</a>
    </div>
    <div class="gallery-item">
        <img src="img/Apple_II.jpg" alt="Image 2">
        <a href="DownloadServlet?file=Apple_II.jpg">Apple II</a>
    </div>
    <div class="gallery-item">
        <img src="img/Atari_800.jpg" alt="Image 3">
        <a href="DownloadServlet?file=Atari_800.jpg">Atari 800</a>
    </div>
    <div class="gallery-item">
        <img src="img/IBM_5100.jpg" alt="Image 4">
        <a href="DownloadServlet?file=IBM_5100.jpg">IBM 5100</a>
    </div>
    <div class="gallery-item">
        <img src="img/IBM_5120.jpg" alt="Image 5">
        <a href="DownloadServlet?file=IBM_5120.jpg">IBM 5120</a>
    </div>
    <div class="gallery-item">
        <img src="img/Macintosh_128k.png" alt="Image 6">
        <a href="DownloadServlet?file=Macintosh_128k.png">Macintosh</a>
    </div>
    <div class="gallery-item">
        <img src="img/Sharp_PC_1500.jpg" alt="Image 7">
        <a href="DownloadServlet?file=Sharp_PC_1500.jpg">Sharp PC 1500</a>
    </div>
    <div class="gallery-item">
        <img src="img/TI-99_4.jsp.png" alt="Image 8">
        <a href="DownloadServlet?file=TI-99_4.jpg">TI 99/4</a>
    </div>
</div>
</body>
</html>

