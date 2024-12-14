package com.controllers;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import models.Feedback;
import models.Package;
import services.FeedbackService;
import services.PackageService;

public class FeedbackServlet extends HttpServlet {
    private final FeedbackService feedbackService = new FeedbackService();
    private final PackageService packageService = new PackageService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        
        if (action != null) {
        	System.out.println("get action is "+action);
            switch (action) {
                case "edit":
				try {
					showEditForm(request, response);
				} catch (ServletException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                    break;
                case "delete":
                    deleteFeedback(request, response);
                    break;
                default:
                    // Handle other actions or show feedback list
				try {
					showFeedbackList(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                    break;
            }
        } else {
            // No action specified, show feedback list
            try {
				showFeedbackList(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "create":
                    createFeedback(request, response);
                    break;
                case "update":
                    updateFeedback(request, response);
                    break;
                default:
                    // Handle other actions or redirect to feedback list
                    response.sendRedirect("feedbacks");
                    break;
            }
        } else {
            // No action specified, redirect to feedback list
            response.sendRedirect("feedbacks");
        }
    }

    private void showFeedbackList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Feedback> feedbacks = feedbackService.getAllFeedbacks();
        request.setAttribute("feedbacks", feedbacks);
        List<Package> packages = packageService.getAllPackages();
        request.setAttribute("packages", packages);
        try {
            System.out.println("packages " + packages.size());
            request.getRequestDispatcher("/feedback.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the package ID from the request
        int packageId = Integer.parseInt(request.getParameter("id"));
        
        System.out.println("editing id "+request.getParameter("id"));
        Feedback feedback = feedbackService.getFeedbackById(packageId);

        
        request.setAttribute("feedback", feedback);
        List<Package> packages = packageService.getAllPackages();
        request.setAttribute("packages", packages);

        // Forward the request to the edit form JSP
        request.getRequestDispatcher("/editFeedback.jsp").forward(request, response);
    }

    private void createFeedback(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // Retrieve feedback data from the form
        int packageId = Integer.parseInt(request.getParameter("rId"));
        int rating1 = Integer.parseInt(request.getParameter("rating1"));
        int rating2 = Integer.parseInt(request.getParameter("rating2"));
        int rating3 = Integer.parseInt(request.getParameter("rating3"));
        String comment = request.getParameter("comment");

        // Create Feedback object
        Feedback feedback = new Feedback();
        feedback.setPackageId(packageId);
        feedback.setRating1(rating1);
        feedback.setRating2(rating2);
        feedback.setRating3(rating3);
        feedback.setComment(comment);

        // Save feedback using the service
        feedbackService.saveFeedback(feedback);

        // Redirect to feedback list
        response.sendRedirect("feedbacks");
    }

    private void updateFeedback(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
  
        int packageId = Integer.parseInt(request.getParameter("rId"));
        int rating1 = Integer.parseInt(request.getParameter("rating1"));
        int rating2 = Integer.parseInt(request.getParameter("rating2"));
        int rating3 = Integer.parseInt(request.getParameter("rating3"));
        String comment = request.getParameter("comment");
        System.out.println("going to update "+packageId);
        // Create Feedback object
        Feedback updatedFeedback = new Feedback();
        updatedFeedback.setPackageId(packageId);
        updatedFeedback.setRating1(rating1);
        updatedFeedback.setRating2(rating2);
        updatedFeedback.setRating3(rating3);
        updatedFeedback.setComment(comment);
        updatedFeedback.setFeedbackId(packageId);
        // Update feedback using the service
        feedbackService.updateFeedback(updatedFeedback);

    
        response.sendRedirect("feedbacks");
    }


    private void deleteFeedback(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
    	feedbackService.deleteFeedback(Integer.parseInt(request.getParameter("id")));
    	List<Feedback> feedbacks = feedbackService.getAllFeedbacks();
        request.setAttribute("feedbacks", feedbacks);
        List<Package> packages = packageService.getAllPackages();
        request.setAttribute("packages", packages);
    	response.sendRedirect("feedbacks");
    	
        
    }
}
