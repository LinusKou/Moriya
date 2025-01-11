package com.example.moriya;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SQLI_1")
public class sqli_1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        try (Connection con = DBUtil.getConnection()) {
            // 不安全的SQL查询，存在SQL注入漏洞
            String query = "SELECT username, email FROM sqli_num WHERE id = " + id;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            while(rs.next()) {
                String username = rs.getString("username");
                String email = rs.getString("email");
                out.println("You are " + username + "<br>");
                out.println("Your email is " + email + "<br>");
            }
            rs.close();
            stmt.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
