🔹 1. Identify High-Usage Columns

Based on the queries you’ve been writing (JOINs, filtering, ordering), these columns are frequently used:

Users Table (users)

email → used for login/search (already indexed ✅).

user_id → used in JOIN with bookings, reviews (primary key already indexed).

Bookings Table (bookings)

user_id → JOIN with users.

listing_id → JOIN with listings.

start_date, end_date → filtering/search for availability.

status → often queried for pending/confirmed bookings.

Listings Table (listings)

location → searching/filtering.

price → filtering/sorting.

host_id → JOIN with users.

Reviews Table (reviews)

listing_id → JOIN with listings.

user_id → JOIN with users.

🔹 2. Create Indexes (database_index.sql)

Here’s the SQL you can save into database_index.sql:

-- =======================================================
-- DATABASE INDEXES FOR OPTIMIZATION
-- =======================================================

-- USERS
CREATE INDEX idx_users_phone ON users(phone_number);

-- BOOKINGS
CREATE INDEX idx_bookings_user_status ON bookings(user_id, status);
CREATE INDEX idx_bookings_dates ON bookings(start_date, end_date);
-- (Composite index improves queries that filter by user and status together,
-- and another one for date range searches.)

-- LISTINGS
CREATE INDEX idx_listings_host ON listings(host_id);
-- (Good for finding all listings by a specific host.)

-- REVIEWS
CREATE INDEX idx_reviews_listing_user ON reviews(listing_id, user_id);
-- (Helps when querying reviews by both listing and user.)

🔹 3. Measuring Performance (Before vs After)

You can measure performance using EXPLAIN (MySQL) or EXPLAIN ANALYZE (Postgres).

Example: Query without index

EXPLAIN
SELECT * 
FROM bookings
WHERE user_id = 10 AND status = 'confirmed';


Before adding indexes: query may scan the entire bookings table (full table scan).

After adding idx_bookings_user_status: it should use an index lookup, drastically reducing execution cost.

Example: Query with date filtering

EXPLAIN
SELECT * 
FROM bookings
WHERE start_date >= '2025-01-01' AND end_date <= '2025-01-31';


Before: table scan.

After: uses idx_bookings_dates.

✅ With these indexes, queries that filter by user, status, date ranges, host, and location will perform much faster.