package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.UserModel;

public class UserDao {
    private Connection connection;

    public UserDao() {
        // Initialize your database connection (Assuming you have a ConnectionManager class)
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/music_store", "root", "");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Map<String, String> validateUser(String email, String password) {
        // Logic to validate user for login
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String userEmail = resultSet.getString("email");
             
                Map<String, String> userMap = new HashMap<>();
                userMap.put("email", userEmail);
               
                return userMap;
            }
            return null; // Returns true if user is found
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean createUser(UserModel user) {
        // Logic to create a new user
        String query = "INSERT INTO users (email, name, password,username) VALUES (?, ?, ?,?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getName()); 
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getUsername());
            return preparedStatement.executeUpdate() > 0; // Returns true if insertion is successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUser(UserModel user) {
        // Logic to update user information
        String query = "UPDATE users SET name = ?, password = ? WHERE email = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());
            return preparedStatement.executeUpdate() > 0; // Returns true if update is successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(String email) {
        // Logic to delete user
        String query = "DELETE FROM users WHERE email = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, email);
            return preparedStatement.executeUpdate() > 0; // Returns true if deletion is successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public UserModel getUserByEmail(String email) {
        // Logic to retrieve user by email
        String query = "SELECT * FROM users WHERE email = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
            	 UserModel user = new UserModel();
                 user.setId(resultSet.getInt("user_id"));
                 user.setUsername(resultSet.getString("username"));
                 user.setName(resultSet.getString("name"));
                 user.setPassword(resultSet.getString("password"));
                 user.setEmail(email);
                 return user;
                
           
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if user not found
    }
    public List<UserModel> getAllUsers() {
  
        List<UserModel> reservations = new ArrayList<>();

        try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users");
                ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
            	UserModel user = new UserModel();
        	   int userId = resultSet.getInt("user_id");
               String username = resultSet.getString("username");
               String fullName = resultSet.getString("name");
               String email = resultSet.getString("email");
               user.setEmail(email);
               user.setName(fullName);
               user.setId(userId);
               user.setUsername(username);
               user.setPassword("");
               reservations.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservations;
    }
}
