package dao;

import models.Booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    private final Connection connection;

    public BookingDAO(Connection connection) {
        this.connection = connection;
    }

    public void saveBooking(Booking booking) {
        String query = "INSERT INTO Booking (photographerId, packageName, packageFee, customerName, contactNumber, venueId,packageId) VALUES (?, ?, ?, ?, ?, ?,?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, booking.getPhotographerId());
            preparedStatement.setString(2, booking.getPackageName());
            preparedStatement.setDouble(3, booking.getPackageFee());
            preparedStatement.setString(4, booking.getCustomerName());
            preparedStatement.setString(5, booking.getContactNumber());
            preparedStatement.setInt(6, booking.getVenueId());
            preparedStatement.setInt(7, booking.getPackageId());
            
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }

    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM Booking";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Booking booking = new Booking();
                booking.setBookingId(resultSet.getInt("bookingId"));
                booking.setPhotographerId(resultSet.getInt("photographerId"));
                booking.setPackageName(resultSet.getString("packageName"));
                booking.setPackageFee(resultSet.getDouble("packageFee"));
                booking.setCustomerName(resultSet.getString("customerName"));
                booking.setContactNumber(resultSet.getString("contactNumber"));
                booking.setVenueId(resultSet.getInt("venueId"));
                booking.setPackageId(resultSet.getInt("packageId"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }

        return bookings;
    }

    public Booking getBookingById(int bookingId) {
        Booking booking = null;
        String query = "SELECT * FROM Booking WHERE bookingId = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, bookingId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    booking = new Booking();
                    booking.setBookingId(resultSet.getInt("bookingId"));
                    booking.setPhotographerId(resultSet.getInt("photographerId"));
                    booking.setPackageName(resultSet.getString("packageName"));
                    booking.setPackageFee(resultSet.getDouble("packageFee"));
                    booking.setCustomerName(resultSet.getString("customerName"));
                    booking.setContactNumber(resultSet.getString("contactNumber"));
                    booking.setVenueId(resultSet.getInt("venueId"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }

        return booking;
    }

    public void updateBooking(Booking booking) {
        String query = "UPDATE Booking SET photographerId = ?, packageName = ?, packageFee = ?, customerName = ?, contactNumber = ?, venueId = ? WHERE bookingId = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
          
            preparedStatement.setDouble(3, booking.getPackageFee());
            preparedStatement.setString(4, booking.getCustomerName());
            preparedStatement.setString(5, booking.getContactNumber());
            preparedStatement.setInt(6, booking.getVenueId());
            preparedStatement.setInt(7, booking.getBookingId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }

    public void deleteBooking(int bookingId) {
        String query = "DELETE FROM Booking WHERE bookingId = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, bookingId);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }
}
