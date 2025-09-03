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
