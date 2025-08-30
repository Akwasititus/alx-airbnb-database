# Database Schema - Airbnb Clone

This project defines the **Airbnb Clone database schema** for the `alx-airbnb-database` repository.

---

## 📌 Entities & Relationships

1. **Users**
   - Stores information about all platform users (guests and hosts).
   - Attributes: `first_name`, `last_name`, `email`, `phone_number`.
   - Primary Key: `user_id`.

2. **Listings**
   - Represents properties listed by hosts.
   - Attributes: `title`, `description`, `price`, `location`.
   - Each listing is created by a host (`host_id` → `users.user_id`).

3. **Bookings**
   - Stores reservations made by users on listings.
   - Attributes: `start_date`, `end_date`, `total_amount`, `status`.
   - Foreign Keys: `user_id` → `users.user_id`, `listing_id` → `listings.listing_id`.
   - Constraint: `start_date < end_date`.

4. **Reviews**
   - Stores feedback from users about listings.
   - Attributes: `rating (1–5)`, `comment`.
   - Foreign Keys: `user_id` → `users.user_id`, `listing_id` → `listings.listing_id`.

---

## 📌 Schema Diagram (ERD)

Users (user_id PK) ───< Listings (listing_id PK, host_id FK)
│ │
│ │
└──< Bookings (booking_id PK, user_id FK, listing_id FK)
│
└──< Reviews (review_id PK, user_id FK, listing_id FK)


---

## 📌 Features

- **Indexes**:
  - On `users.email`, `listings.price`, `listings.location` for faster lookups.
- **Constraints**:
  - `UNIQUE (email)` in `users`.
  - `CHECK (rating BETWEEN 1 AND 5)` in `reviews`.
  - `CHECK (start_date < end_date)` in `bookings`.

---

## 📌 Usage

To set up the database schema:

```bash
mysql -u akwasititus -p alx-airbnb-db < schema.sql
