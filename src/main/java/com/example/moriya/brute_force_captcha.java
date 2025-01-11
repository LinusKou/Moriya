package com.example.moriya;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/captcha")
public class brute_force_captcha extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection con = DBUtil.getConnection()) {
            // 安全的SQL查询，使用预处理语句防止SQL注入
            String query = "SELECT * FROM brute_force_captcha WHERE username = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            PrintWriter out = response.getWriter();
            if(rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                out.print("success");
            } else {
                out.print("fail");
            }
            rs.close();
            ps.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}