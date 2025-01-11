package com.example.moriya;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/xss_store")
public class xss_store extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addMessage(request, response);
        } else if ("delete".equals(action)) {
            deleteMessage(request, response);
        }
    }

    private void addMessage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String message = request.getParameter("message");
        HttpSession session = request.getSession();
        List<String> messages = (List<String>) session.getAttribute("messages");

        if (messages == null) {
            messages = new ArrayList<>();
            session.setAttribute("messages", messages);
        }

        messages.add(message);
        response.sendRedirect("XSS_store.jsp");
    }

    private void deleteMessage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        HttpSession session = request.getSession();
        List<String> messages = (List<String>) session.getAttribute("messages");

        if (messages != null && index >= 0 && index < messages.size()) {
            messages.remove(index);
        }

        response.setContentType("text/html");
        response.getWriter().write("success");
    }
}

