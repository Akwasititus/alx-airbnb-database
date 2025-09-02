-- =========================
-- 1. INNER JOIN – All bookings with the respective users
-- =========================

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_amount,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM bookings b
INNER JOIN users u
    ON b.user_id = u.user_id;





-- ===================================
-- 2. LEFT JOIN – All listings and their reviews (including listings with no reviews)
-- ===================================

SELECT 
    l.listing_id,
    l.title,
    l.location,
    r.review_id,
    r.rating,
    r.comment,
    r.user_id
FROM listings l
LEFT JOIN reviews r
    ON l.listing_id = r.listing_id;


-- ===================================

-- 3. FULL OUTER JOIN – All users and all bookings (even if no match)
-- ❗ MySQL doesn’t support FULL OUTER JOIN directly, so if you’re using MySQL, you need to simulate it with a UNION.
-- ===================================

-- Works in PostgreSQL, SQL Server, Oracle
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.listing_id,
    b.start_date,
    b.end_date
FROM users u
FULL OUTER JOIN bookings b
    ON u.user_id = b.user_id;


✅ If you’re using MySQL, replace with:

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.listing_id,
    b.start_date,
    b.end_date
FROM users u
LEFT JOIN bookings b
    ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.listing_id,
    b.start_date,
    b.end_date
FROM users u
RIGHT JOIN bookings b
    ON u.user_id = b.user_id;
