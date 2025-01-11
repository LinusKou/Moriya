package com.example.moriya;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ping")
public class ping extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ip = request.getParameter("ip");

        StringBuilder output = new StringBuilder();
        try {
            // 使用cmd.exe /c在Windows上执行命令
            String command = "cmd.exe /c ping " + ip;
            Process process = Runtime.getRuntime().exec(command);
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));

            String line;
            while ((line = reader.readLine()) != null) {
                output.append(line).append("<br>");
            }
        } catch (IOException e) {
            output.append("Error executing command: ").append(e.getMessage());
        }

        response.setContentType("text/html");
        response.getWriter().write(output.toString());
    }
}


