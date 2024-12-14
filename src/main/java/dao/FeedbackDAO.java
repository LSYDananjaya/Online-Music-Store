package dao;

import models.Feedback;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {
    private final Connection connection;

    public FeedbackDAO(Connection connection) {
        this.connection = connection;
    }

    public void saveFeedback(Feedback feedback) {
        String insertQuery = "INSERT INTO feedback (packageId, rating1, rating2, rating3, comment) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
            preparedStatement.setInt(1, feedback.getPackageId());
            preparedStatement.setInt(2, feedback.getRating1());
            preparedStatement.setInt(3, feedback.getRating2());
            preparedStatement.setInt(4, feedback.getRating3());
            preparedStatement.setString(5, feedback.getComment());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }

    public List<Feedback> getAllFeedbacks() {
        List<Feedback> feedbackList = new ArrayList<>();
        String selectAllQuery = "SELECT * FROM feedback";

        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(selectAllQuery)) {

            while (resultSet.next()) {
                Feedback feedback = extractFeedbackFromResultSet(resultSet);
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }

        return feedbackList;
    }

    public Feedback getFeedbackById(int feedbackId) {
        String selectByIdQuery = "SELECT * FROM feedback WHERE feedbackId = ?";
        Feedback feedback = null;

        try (PreparedStatement preparedStatement = connection.prepareStatement(selectByIdQuery)) {
            preparedStatement.setInt(1, feedbackId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                feedback = extractFeedbackFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }

        return feedback;
    }

    public void updateFeedback(Feedback feedback) {
        String updateQuery = "UPDATE feedback SET packageId = ?, rating1 = ?, rating2 = ?, rating3 = ?, comment = ? WHERE feedbackId = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
            preparedStatement.setInt(1, feedback.getPackageId());
            preparedStatement.setInt(2, feedback.getRating1());
            preparedStatement.setInt(3, feedback.getRating2());
            preparedStatement.setInt(4, feedback.getRating3());
            preparedStatement.setString(5, feedback.getComment());
            preparedStatement.setInt(6, feedback.getFeedbackId());
            System.out.println("feed back updated" + feedback.getFeedbackId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }

    public void deleteFeedback(int feedbackId) {
        String deleteQuery = "DELETE FROM feedback WHERE feedbackId = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
            preparedStatement.setInt(1, feedbackId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }

    private Feedback extractFeedbackFromResultSet(ResultSet resultSet) throws SQLException {
        Feedback feedback = new Feedback();
        feedback.setFeedbackId(resultSet.getInt("feedbackId"));
        feedback.setPackageId(resultSet.getInt("packageId"));
        feedback.setRating1(resultSet.getInt("rating1"));
        feedback.setRating2(resultSet.getInt("rating2"));
        feedback.setRating3(resultSet.getInt("rating3"));
        feedback.setComment(resultSet.getString("comment"));
        return feedback;
    }
}
