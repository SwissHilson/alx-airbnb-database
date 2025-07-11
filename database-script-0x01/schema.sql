CREATE DATABASE IF NOT EXISTS airbnb_db;
USE airbnb_db;

-- -----------------------------------------------------
-- Table: User
-- -----------------------------------------------------
CREATE TABLE User (
    user_id CHAR(36) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id),
    INDEX idx_user_email (email)
);

-- -----------------------------------------------------
-- Table: Property
-- -----------------------------------------------------
CREATE TABLE Property (
    property_id CHAR(36) NOT NULL,
    host_id CHAR(36) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (property_id),
    FOREIGN KEY (host_id) REFERENCES User(user_id)
);

-- -----------------------------------------------------
-- Table: Booking
-- -----------------------------------------------------
CREATE TABLE Booking (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    INDEX idx_booking_property_id (property_id),
    INDEX idx_booking_booking_id (booking_id)
);

-- -----------------------------------------------------
-- Table: Payment
-- -----------------------------------------------------
CREATE TABLE Payment (
    payment_id CHAR(36) NOT NULL,
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    PRIMARY KEY (payment_id),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    INDEX idx_payment_booking_id (booking_id)
);

-- -----------------------------------------------------
-- Table: Review
-- -----------------------------------------------------
CREATE TABLE Review (
    review_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (review_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- -----------------------------------------------------
-- Table: Message
-- -----------------------------------------------------
CREATE TABLE Message (
    message_id CHAR(36) NOT NULL,
    sender_id CHAR(36) NOT NULL,
    recipient_id CHAR(36) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (message_id),
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);

