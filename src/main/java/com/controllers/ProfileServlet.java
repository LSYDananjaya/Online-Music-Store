package com.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.UserModel;
import services.UserService;


public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	
        String userEmail = getUserEmailFromCookies(request);

        if (userEmail != null) {
            // Create a UserService instance
            UserService userService = new UserService();

            // Get the user by email
            UserModel user = userService.getUserByEmail(userEmail);

            if (user != null) {
                // Forward the user information to the profile view
                request.setAttribute("user", user);
                request.getRequestDispatcher("/myprofile.jsp").forward(request, response);
                return;
            }
        }

        // Redirect to the login page if user email is not found or user doesn't exist
        response.sendRedirect("LoginView.jsp");
    }

    private String getUserEmailFromCookies(HttpServletRequest request) {
        // Retrieve user email from cookies
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("email")) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "update":
                    performUpdate(request, response);
                    break;
                case "delete":
                    performDelete(request, response);
                    break;
                default:
                    response.sendRedirect("myprofile.jsp");
            }
        }
    }

    private void performUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = getUserEmailFromCookies(request);
        if (email != null) {
            UserService userService = new UserService();
            UserModel user = userService.getUserByEmail(email);

            if (user != null) {
                String fullName = request.getParameter("fullName");
                String phoneNo = request.getParameter("phoneNo");

                user.setName(fullName);
                user.setPhoneNo(phoneNo);

                if (userService.updateUser(user)) {
                	String path = request.getContextPath().toString();
                    response.sendRedirect(path+"/profile");
                    return;
                }
            }
        }

        response.getWriter().println("Update failed. Please try again.");
    }

    private void performDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = getUserEmailFromCookies(request);
        if (email != null) {
            UserService userService = new UserService();
            if (userService.deleteUser(email)) {
            
                request.getSession().invalidate();
                response.sendRedirect("login.jsp");
                return;
            }
        }

        response.getWriter().println("Delete failed. Please try again.");
    }
}
