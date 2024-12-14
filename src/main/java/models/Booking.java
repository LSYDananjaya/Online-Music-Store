package models;

public class Booking {
    private int bookingId;
    private int photographerId;
    private String packageName;
    private double packageFee;
    private String customerName;
    private String contactNumber;
    private int venueId;
    private int packageId;
 

    public Booking() {
    }

    public Booking(int bookingId, int photographerId, String packageName, double packageFee, String customerName, String contactNumber, int venueId) {
        this.bookingId = bookingId;
        this.photographerId = photographerId;
        this.packageName = packageName;
        this.packageFee = packageFee;
        this.customerName = customerName;
        this.contactNumber = contactNumber;
        this.venueId = venueId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getPhotographerId() {
        return photographerId;
    }

    public void setPhotographerId(int photographerId) {
        this.photographerId = photographerId;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public double getPackageFee() {
        return packageFee;
    }

    public void setPackageFee(double packageFee) {
        this.packageFee = packageFee;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public int getVenueId() {
        return venueId;
    }

    public void setVenueId(int venueId) {
        this.venueId = venueId;
    }

	public void setPackageId(int pkgId) {
		this.packageId = pkgId;
		
	}
	
	public int getPackageId() {
		return this.packageId;
	}
}
