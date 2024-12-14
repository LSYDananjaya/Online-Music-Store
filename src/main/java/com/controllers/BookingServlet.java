package com.controllers;

import java.io.IOException;
import java.sql.DriverManager;
import java.util.List;

import com.mysql.jdbc.Connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Booking;
import models.Package;
import services.BookingService;
import services.PackageService;

public class BookingServlet extends HttpServlet {
    private final BookingService bookingService;
    private final PackageService packageService = new PackageService();
    public BookingServlet() {
     
        this.bookingService = new BookingService(getConnection());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        List<Booking> bookings = bookingService.getAllBookings();
       
        request.setAttribute("bookings", bookings);
        
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "delete":
                    handleDelete(request, response);
                    return; 
                case "edit":
                	handleEdit(request,response);
                	return;
                default:
                	try {
                        
                        request.getRequestDispatcher("/bookingList.jsp").forward(request, response);
                    } catch (ServletException e) {
                        e.printStackTrace();
                   
                    }
            }
        }else {
        	try {
                
                request.getRequestDispatcher("/bookingList.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
           
            }
        }

        
    }
    private void handleDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bookingIdParam = request.getParameter("id");
        if (bookingIdParam != null) {
            int bookingId = Integer.parseInt(bookingIdParam);
            bookingService.deleteBooking(bookingId);
           
            response.sendRedirect(request.getContextPath() + "/bookings");
        } else {
          
            response.sendRedirect(request.getContextPath() + "/bookings");
        }
    }
    private void handleEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bookingIdParam = request.getParameter("id");
        if (bookingIdParam != null) {
            int bookingId = Integer.parseInt(bookingIdParam);
           Booking booking = bookingService.getBookingById(bookingId);
           List<Package> packages = packageService.getAllPackages();
           
           request.setAttribute("booking", booking);
           request.setAttribute("packages", packages);
           
           try {
			request.getRequestDispatcher("/editBooking.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        } else {
          
            response.sendRedirect(request.getContextPath() + "/bookings");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
       

        String action = request.getParameter("action");
        System.out.println("asdasd "+action);
        if ("create".equals(action)) {
            // Create a new booking
            createBooking(request, response);
        } else if ("edit".equals(action)) {
        	System.out.println("Post action "+ action);
            // Edit an existing booking
            editBooking(request, response);
        } else if ("delete".equals(action)) {
            // Delete a booking
            deleteBooking(request, response);
        } else {
            // Handle other actions or errors
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void createBooking(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Retrieve values from the form
        int packageId = Integer.parseInt(request.getParameter("packageId"));
        String name = request.getParameter("name");
        String contactNo = request.getParameter("pno");
        int venueId = Integer.parseInt(request.getParameter("venueId"));

        // Create a Booking object and set values
        Booking booking = new Booking();
        booking.setPackageId(packageId);
        booking.setCustomerName(name);
        booking.setContactNumber(contactNo);
        booking.setVenueId(venueId);

        // Save the booking using the service
        bookingService.saveBooking(booking);

        // Redirect to the bookings page
        response.sendRedirect(request.getContextPath() + "/bookings");
    }


    private void editBooking(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Retrieve values from the form
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        int packageId = Integer.parseInt(request.getParameter("packageId"));
        String customerName = request.getParameter("customerName");
        String contactNumber = request.getParameter("contactNumber");
        int venueId = Integer.parseInt(request.getParameter("venueId"));

        // Get the existing booking
        Booking booking = bookingService.getBookingById(bookingId);

        // Set new values
        booking.setPackageId(packageId);
        booking.setCustomerName(customerName);
        booking.setContactNumber(contactNumber);
        booking.setVenueId(venueId);

        // Update the booking
        bookingService.updateBooking(booking);

        // Redirect to the bookings page
        response.sendRedirect(request.getContextPath() + "/bookings");
    }


    private void deleteBooking(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Implement the logic to retrieve the booking to be deleted
        // from the request parameters and call the BookingService to delete it

        // Example:
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        bookingService.deleteBooking(bookingId);

        // Redirect or display a success message as needed
        // For example, redirect back to the booking list
        response.sendRedirect(request.getContextPath() + "/bookings");
    }

    // Implement the getConnection method to obtain a database connection
    private Connection getConnection() {
        // You need to implement the logic to obtain a connection
        // This is just a placeholder, and you might want to use a connection pool
        // in a real-world scenario
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/music_store", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
        return connection;
    }
}
