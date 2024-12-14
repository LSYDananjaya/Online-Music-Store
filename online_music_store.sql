CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone_no VARCHAR(15) NOT NULL
);



CREATE TABLE packages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    packageName VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    releasedYear INT,
    language VARCHAR(255),
    numberOfSongs INT,
    packagePrice DOUBLE,
    availableTimePeriod VARCHAR(255),
    packagePoster VARCHAR(255)
);
CREATE TABLE feedback (
    feedbackId INT PRIMARY KEY AUTO_INCREMENT,
    packageId INT,
    rating1 INT,
    rating2 INT,
    rating3 INT,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Booking (
    bookingId INT PRIMARY KEY AUTO_INCREMENT,
    photographerId INT,
    packageName VARCHAR(255),
    packageFee DOUBLE,
    customerName VARCHAR(255),
    contactNumber VARCHAR(20),
    venueId INT,
    packageId INT
  
);
