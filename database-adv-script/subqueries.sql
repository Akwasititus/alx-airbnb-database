-- 1. Non-Correlated Subquery

-- Find all properties where the average rating is greater than 4.0.

-- Here, the subquery calculates the average rating per listing, and the outer query filters listings based on that.

SELECT 
    l.listing_id,
    l.title,
    l.location,
    l.price
FROM listings l
WHERE l.listing_id IN (
    SELECT r.listing_id
    FROM reviews r
    GROUP BY r.listing_id
    HAVING AVG(r.rating) > 4.0
);


-- 2. Correlated Subquery

-- Find users who have made more than 3 bookings.

-- Here, the subquery is correlated because it depends on the outer query’s user_id.

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;