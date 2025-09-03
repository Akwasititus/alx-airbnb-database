-- 🔹 1. Aggregation with COUNT + GROUP BY

-- 👉 Find the total number of bookings made by each user.

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b 
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;



-- 🔹 2. Window Function – Ranking Properties by Total Bookings

-- 👉 Rank properties (listings) based on number of bookings.

SELECT 
    l.listing_id,
    l.title,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM listings l
LEFT JOIN bookings b 
    ON l.listing_id = b.listing_id
GROUP BY l.listing_id, l.title
ORDER BY booking_rank;