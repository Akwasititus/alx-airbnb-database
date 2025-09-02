# Airbnb Clone Database – SQL Joins Practice

This project is a simplified **Airbnb Clone Database Schema** for practicing SQL queries, especially different types of JOINs.  

## 📂 Schema Overview

The database contains the following tables:

- **users**  
  Stores user information (guests & hosts).

- **listings**  
  Represents properties created by hosts.

- **bookings**  
  Stores booking details between users and listings.

- **reviews**  
  Stores user reviews for listings.

### ERD Structure
users (1) ───< listings
users (1) ───< bookings
users (1) ───< reviews
listings (1) ───< bookings
listings (1) ───< reviews

yaml
Copy code

---

## 🛠 SQL Joins Examples

### 1. INNER JOIN – Bookings with Users
Retrieve all bookings and the respective users who made them.
```sql
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
2. LEFT JOIN – Listings with Reviews
Retrieve all listings and their reviews, including listings with no reviews.

sql
Copy code
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
3. FULL OUTER JOIN – Users and Bookings
Retrieve all users and all bookings, even if a user has no booking or a booking is not linked to a user.

PostgreSQL / SQL Server:
sql
Copy code
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
MySQL (simulate FULL OUTER JOIN with UNION):
sql
Copy code
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
🚀 How to Use
Run the schema file:

sh
Copy code
mysql -u root -p < schema.sql
Insert some test data into each table.

Run the SQL queries from above to see JOIN results.

📚 Learning Objectives
Understand different types of SQL JOINs:

INNER JOIN → Matching rows only

LEFT JOIN → All from the left table, matched or not

FULL OUTER JOIN → All rows from both tables, matched or not

Practice writing clean SQL queries

Work with relational data in a real-world schema