package com.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.UserModel;
import services.UserService;

public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        String username = request.getParameter("username"); 
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Create a new UserModel and set its properties
        UserModel user = new UserModel();
        user.setUsername(username);
        user.setName(fullName);
        user.setEmail(email);
        user.setPassword(password);

        // Create a UserService instance
        UserService userService = new UserService();

        // Use UserService to create a new user
        boolean signupSuccess = userService.createUser(user);

        if (signupSuccess) {
        	Cookie emailCookie = new Cookie("email", email);
            emailCookie.setMaxAge(30 * 24 * 60 * 60); 
            response.addCookie(emailCookie);
            response.sendRedirect("index.jsp");
        } else {
       
            response.getWriter().println("Signup failed. Please try again.");
        }
    }
}
