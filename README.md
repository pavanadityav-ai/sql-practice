# SQL Practice

SQL queries I wrote while learning data analysis. The sample data is modelled on my family's coconut business: buyers in different cities and their lorry orders.

## Files

| File | What it covers |
|---|---|
| `group_by.sql` | `GROUP BY`, `WHERE`, `HAVING`, `ORDER BY` on a sales table |
| `joins.sql` | `INNER JOIN`, `LEFT JOIN`, finding buyers with no orders (`IS NULL`), revenue per city |

Queries in `joins.sql` include a comment with the expected result.

## What I learned

- `WHERE` filters rows **before** grouping; `HAVING` filters groups **after**.
- With a `LEFT JOIN`, use `COUNT(column)` instead of `COUNT(*)`, so buyers with no orders show 0 instead of 1.

## How to run

Each file creates its own tables, so you can paste it into any SQL engine (for example SQLite or the online [sqliteonline.com](https://sqliteonline.com)) and run it top to bottom.
