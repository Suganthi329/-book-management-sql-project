# Book Management System – SQL Project

## Project Description
This project demonstrates a Book Management System using SQL.
It focuses on relational database design and query writing.

## Tables Used
- Authors
- Books
- Publishers
- Platforms
- Stores

## SQL Concepts Used
- Primary & Foreign Keys
- INNER JOIN and LEFT JOIN
- Aggregate Functions (SUM, COUNT, AVG)
- GROUP BY and HAVING
- Subqueries
- DISTINCT and NULL handling

## Sample Query
```sql
select a.a_name, b.b_name, p.platform_name
from authors a
left join books b on a.author_id = b.b_author_id
left join platforms p on b.book_id = p.b_platform;
