-- performance.sql
-- Retrieve all bookings with user, listing, and payment details

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_amount AS payment_amount,
    b.status AS payment_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    l.listing_id,
    l.title AS property_title,
    l.location AS property_location,
    l.price AS property_price,
    l.host_id AS host_user_id
FROM bookings b
INNER JOIN users u 
    ON b.user_id = u.user_id
INNER JOIN listings l 
    ON b.listing_id = l.listing_id
ORDER BY b.created_at DESC;
