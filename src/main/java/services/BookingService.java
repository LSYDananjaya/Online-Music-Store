package services;

import dao.BookingDAO;
import models.Booking;

import java.sql.Connection;
import java.util.List;

public class BookingService {
    private final BookingDAO bookingDAO;

    public BookingService(Connection connection) {
        this.bookingDAO = new BookingDAO(connection);
    }

    public void saveBooking(Booking booking) {
        bookingDAO.saveBooking(booking);
    }

    public List<Booking> getAllBookings() {
        return bookingDAO.getAllBookings();
    }

    public Booking getBookingById(int bookingId) {
        return bookingDAO.getBookingById(bookingId);
    }

    public void updateBooking(Booking booking) {
        bookingDAO.updateBooking(booking);
    }

    public void deleteBooking(int bookingId) {
        bookingDAO.deleteBooking(bookingId);
    }
}
