-- ================================
-- SEED DATA FOR AIRBNB DATABASE
-- ================================

-- Insert Users
INSERT INTO users (user_id, name, email, phone, created_at)
VALUES
(1, 'Alice Johnson', 'alice@example.com', '+233501234567', NOW()),
(2, 'Michael Smith', 'mike@example.com', '+233541234567', NOW()),
(3, 'Grace Brown', 'grace@example.com', '+233271234567', NOW());

-- Insert Properties
INSERT INTO properties (property_id, user_id, title, description, location, price_per_night, created_at)
VALUES
(1, 1, 'Cozy Apartment in Accra', '2 bedroom apartment with AC and WiFi', 'Accra, Ghana', 80.00, NOW()),
(2, 2, 'Beach House in Cape Coast', 'Beautiful sea view with private pool', 'Cape Coast, Ghana', 150.00, NOW()),
(3, 3, 'Guest Room in Kumasi', 'Affordable guest room near city center', 'Kumasi, Ghana', 50.00, NOW());

-- Insert Bookings
INSERT INTO bookings (booking_id, user_id, property_id, start_date, end_date, status, created_at)
VALUES
(1, 2, 1, '2025-09-10', '2025-09-15', 'confirmed', NOW()),
(2, 3, 2, '2025-10-01', '2025-10-05', 'pending', NOW()),
(3, 1, 3, '2025-11-20', '2025-11-25', 'confirmed', NOW());

-- Insert Payments
INSERT INTO payments (payment_id, booking_id, amount, method, status, created_at)
VALUES
(1, 1, 400.00, 'credit_card', 'completed', NOW()),
(2, 2, 600.00, 'mobile_money', 'pending', NOW()),
(3, 3, 250.00, 'paypal', 'completed', NOW());
