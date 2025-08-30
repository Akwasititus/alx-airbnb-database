# Database Normalization (to 3NF)

This document explains the normalization steps applied to our Airbnb-style database design to ensure that the schema is in **Third Normal Form (3NF)**.

---

## Step 1: Unnormalized Form (UNF)

Initially, we could have a single table like this:

**Bookings Table (UNF)**

| booking_id | user_name | user_email | property_name | property_location | host_name | host_email | check_in | check_out | payment_method | amount |
|------------|-----------|------------|---------------|------------------|-----------|------------|----------|-----------|----------------|--------|

### Problems:
- Repeated data (user info, host info, property info).
- Redundancy (if a user makes multiple bookings, their name/email repeats).
- Update anomalies (changing a host’s email would require multiple updates).
- Insert anomalies (cannot add a new property without a booking).
- Delete anomalies (deleting a booking could remove host/property data).

---

## Step 2: First Normal Form (1NF)

**Rules of 1NF**
- Eliminate repeating groups.
- Each field should contain atomic (indivisible) values.
- Each record must be unique.

### Changes:
- Separate users, hosts, properties, and bookings into their own tables.
- Ensure atomic values (no multiple emails, phone numbers in a single column).

**Tables in 1NF:**

- **Users(user_id, name, email, phone)**
- **Hosts(host_id, name, email, phone)**
- **Properties(property_id, host_id, name, location, price)**
- **Bookings(booking_id, user_id, property_id, check_in, check_out, amount)**
- **Payments(payment_id, booking_id, method, status, amount)**

---

## Step 3: Second Normal Form (2NF)

**Rules of 2NF**
- Be in 1NF.
- Remove partial dependencies (no attribute should depend only on part of a composite key).

### Changes:
- Booking table depends on `booking_id` (single PK).
- Payment table depends on `payment_id`.
- All non-key attributes depend fully on the primary key.

✅ No partial dependencies remain.

---

## Step 4: Third Normal Form (3NF)

**Rules of 3NF**
- Be in 2NF.
- Remove transitive dependencies (non-key attributes should not depend on other non-key attributes).

### Example of violation:
- If `property_location` depended on `property_id` but also indirectly determined `host_location`, we would need to separate it.

### Final Adjustments:
- Ensure property details depend only on `property_id`.
- Ensure user details depend only on `user_id`.
- Ensure payment details depend only on `payment_id`.

✅ After restructuring, we are in **3NF**.

---

## Final Database Schema (3NF)

- **Users(user_id PK, name, email, phone)**
- **Hosts(host_id PK, name, email, phone)**
- **Properties(property_id PK, host_id FK → Hosts, name, location, price)**
- **Bookings(booking_id PK, user_id FK → Users, property_id FK → Properties, check_in, check_out, amount)**
- **Payments(payment_id PK, booking_id FK → Bookings, method, status, amount)**

---

## Benefits of 3NF
- Eliminates redundancy.
- Prevents anomalies (insert, update, delete).
- Ensures data consistency.
- Makes queries more efficient.

---

✅ The database is now in **Third Normal Form (3NF)**.
