Partition Performance Report
Objective

To improve query performance on the large bookings table by implementing table partitioning based on the start_date column.

Partitioning Strategy

The bookings_partitioned table was created with RANGE partitioning on the YEAR(start_date).

Partitions created:

p2023 → bookings before 2024

p2024 → bookings before 2025

p2025 → bookings before 2026

pmax → all future bookings

This ensures queries filtered by year will only scan the relevant partition.

Test Query
EXPLAIN
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';

Performance Analysis
Before Partitioning

Query scanned the entire bookings table.

EXPLAIN showed a full table scan (ALL in type column).

On large datasets, this resulted in slow response times.

After Partitioning

Query scanned only the 2025 partition.

EXPLAIN confirmed partition pruning was applied.

Rows examined were significantly reduced, lowering query execution time.

Observed Improvements

Query speed: Faster execution for queries filtered by date range.

Scalability: New partitions can be added for future years without affecting existing ones.

Maintenance: Old partitions (e.g., past years) can be archived or dropped easily.

Conclusion

Partitioning the bookings table by start_date improved performance for time-based queries. Queries no longer scan the entire dataset but instead target only relevant partitions, leading to faster and more efficient data retrieval.