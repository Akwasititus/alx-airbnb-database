-- performance.sql
-- Analyze query performance for bookings with joins

EXPLAIN
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
WHERE b.status = 'confirmed'
  AND b.start_date >= '2025-01-01'
ORDER BY b.created_at DESC;
