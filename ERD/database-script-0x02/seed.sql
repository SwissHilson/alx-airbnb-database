INSERT INTO User (user_id, first_name, last_name, email, password_hash, role)
VALUES
    ('uuid-1', 'John', 'Doe', 'john@example.com', 'hashed_password', 'guest'),
    ('uuid-2', 'Jane', 'Smith', 'jane@example.com', 'hashed_password', 'host');

INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
    ('uuid-3', 'uuid-2', 'Ocean View Apartment', 'Lovely apartment with sea views.', 'Lagos', 120.00);

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    ('uuid-4', 'uuid-3', 'uuid-1', '2025-07-01', '2025-07-07', 720.00, 'confirmed');

INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
    ('uuid-5', 'uuid-4', 720.00, 'paypal');

INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
    ('uuid-6', 'uuid-3', 'uuid-1', 5, 'Fantastic stay!');

INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
    ('uuid-7', 'uuid-1', 'uuid-2', 'Hi, I have a question about the property.');

