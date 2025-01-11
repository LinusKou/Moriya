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
import jakarta.servlet.http.HttpSession;

@WebServlet("/SQLI_0")
public class sqli_0 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection con = DBUtil.getConnection()) {
            // 不安全的SQL查询
            String query = "SELECT * FROM sqli_0 WHERE user = '" + username + "' AND password = '" + password + "'";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            PrintWriter out = response.getWriter();
            if(rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                out.print("success");
            } else {
                out.print("fail");
            }
            rs.close();
            stmt.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
