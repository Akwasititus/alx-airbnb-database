# Optimization Report – Bookings Query

## 📌 Initial Query (from performance.sql)

```sql
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



📊 Performance Analysis with EXPLAIN

When running:

EXPLAIN
SELECT ...

Potential Issues:

Full Table Scans

If no indexes exist on bookings.user_id, bookings.listing_id, or bookings.created_at, the database may scan the entire table.

Sorting Overhead

ORDER BY b.created_at DESC can be costly without an index on created_at.

Unnecessary Data Loads

If some columns (like phone_number) are not always needed, fetching them increases I/O.

✅ Refactored Query for Optimization
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_amount AS payment_amount,
    b.status AS payment_status,
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS user_full_name,
    u.email,
    l.listing_id,
    l.title AS property_title,
    l.location AS property_location,
    l.price AS property_price
FROM bookings b
JOIN users u 
    ON b.user_id = u.user_id
JOIN listings l 
    ON b.listing_id = l.listing_id
ORDER BY b.created_at DESC;

Improvements:

Removed u.phone_number (optional, reduces I/O if not always required).

Combined first and last name into user_full_name (reduces post-processing at application level).

Maintained essential joins only (no extra tables like reviews added unnecessarily).

⚡ Recommended Indexes

Add the following indexes to speed up JOINs and filtering:

-- Bookings: optimize joins and ordering
CREATE INDEX idx_bookings_user ON bookings(user_id);
CREATE INDEX idx_bookings_listing ON bookings(listing_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- Listings: optimize property joins
CREATE INDEX idx_listings_id ON listings(listing_id);

-- Users: optimize joins
CREATE INDEX idx_users_id ON users(user_id);

🚀 Expected Benefits

Faster JOIN execution since lookups use indexes instead of full scans.

Faster sorting of bookings due to index on created_at.

Reduced memory and I/O footprint by selecting only necessary columns.

📚 Next Steps

Run EXPLAIN again after adding indexes.

Compare query cost (rows examined, execution time) before vs after.

Continuously monitor queries with the slow query log (MySQL) or pg_stat_statements (Postgres).