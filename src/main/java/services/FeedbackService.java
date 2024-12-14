package services;

import dao.FeedbackDAO;
import models.Feedback;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class FeedbackService {
    private final FeedbackDAO feedbackDAO;
    private Connection connection;
    public FeedbackService() {
    		
    	 try {
             Class.forName("com.mysql.jdbc.Driver");
         } catch (ClassNotFoundException e) {
             e.printStackTrace();
         }
         try {
             connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/music_store", "root", "");
         } catch (SQLException e) {
             e.printStackTrace();
         }
        this.feedbackDAO = new FeedbackDAO(connection);
    }

    public void saveFeedback(Feedback feedback) {
        feedbackDAO.saveFeedback(feedback);
    }
    public List<Feedback> getAllFeedbacks() {
        return feedbackDAO.getAllFeedbacks();
    }

    public Feedback getFeedbackById(int feedbackId) {
        return feedbackDAO.getFeedbackById(feedbackId);
    }

    public void updateFeedback(Feedback feedback) {
        feedbackDAO.updateFeedback(feedback);
    }

    public void deleteFeedback(int feedbackId) {
        feedbackDAO.deleteFeedback(feedbackId);
    }
}
