# Database Seed Script (0x02)

This folder contains SQL scripts to populate the **Airbnb Database** with sample data.

## Files
- **seed.sql** → Inserts sample data for `users`, `properties`, `bookings`, and `payments`.

## How to Run
1. Ensure the schema has already been created (see `database-script-0x01/schema.sql`).
2. Run the script in your SQL environment:
   ```bash
   mysql -u root -p airbnb_db < seed.sql


   Verify inserted records:

SELECT * FROM users;
SELECT * FROM properties;
SELECT * FROM bookings;
SELECT * FROM payments;
