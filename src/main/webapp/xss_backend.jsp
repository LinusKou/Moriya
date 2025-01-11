<%--
  Created by IntelliJ IDEA.
  User: 许文
  Date: 2024/12/25
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.example.moriya.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>XSS Data</title>
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
    .xss-container {
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      width: 70%;
    }
    .xss-container h2 {
      margin-bottom: 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }
    table, th, td {
      border: 1px solid #ccc;
    }
    th, td {
      padding: 10px;
      text-align: left;
    }
    .delete-btn {
      color: red;
      cursor: pointer;
    }
  </style>
</head>
<body>
<div class="xss-container">
  <h2>XSS Data</h2>
  <table>
    <thead>
    <tr>
      <th>ID</th>
      <th>Time</th>
      <th>IP Address</th>
      <th>Cookie</th>
      <th>Referer</th>
      <th>User Agent</th>
      <th>Action</th>
    </tr>
    </thead>
    <tbody id="xss-data">
    <%
      try (Connection conn = DBUtil.getConnection()) {
        String sql = "SELECT * FROM xss_data";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
          int id = rs.getInt("id");
          String time = rs.getString("time");
          String ipAddress = rs.getString("ipaddress");
          String cookie = rs.getString("cookie");
          String referer = rs.getString("referer");
          String userAgent = rs.getString("useragent");
    %>
    <tr>
      <td><%= id %></td>
      <td><%= time %></td>
      <td><%= ipAddress %></td>
      <td><%= cookie %></td>
      <td><%= referer %></td>
      <td><%= userAgent %></td>
      <td><span class="delete-btn" onclick="deleteLogEntry(<%= id %>)">&times;</span></td>
    </tr>
    <%
        }
        rs.close();
        stmt.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
    </tbody>
  </table>
</div>
<script>
  function deleteLogEntry(id) {
    $.ajax({
      type: 'GET',
      url: 'xss_backend',
      data: { action: 'deleteLog', id: id },
      success: function() {
        location.reload();
      }
    });
  }
</script>
</body>
</html>
