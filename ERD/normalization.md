# Database Normalization - Airbnb Clone

All tables have been designed to satisfy the principles of 3NF.

## 1NF
- All attributes are atomic and indivisible.

## 2NF
- All non-key attributes fully depend on the entire primary key (since no tables have composite PKs, 2NF is satisfied).

## 3NF
- No transitive dependencies exist.
- Example:
    - In Booking, total_price depends on Booking itself, not indirectly via Property or User.
    - In Review, rating depends directly on Review.

Thus, the schema is normalized to 3NF and avoids redundancy.

