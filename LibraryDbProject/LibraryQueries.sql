use library;

-- 01
SELECT * FROM loans WHERE member_id = 5 AND return_date IS NOT NULL;

-- 02
SELECT * FROM members WHERE membership_date >= '2022-01-01';

-- 03
SELECT * FROM books WHERE available_copies > 0 AND publish_date > 1920-01-01;

-- 04
SELECT * FROM book_genres WHERE book_id IN (SELECT book_id FROM Books WHERE author_id = 6);

-- 05 
SELECT member_id, COUNT(*) AS total_loans 
FROM Loans 
GROUP BY member_id;

-- 06
SELECT title, publish_date 
FROM Books 
ORDER BY publish_date DESC;

-- 07
SELECT m.first_name, m.last_name, b.title 
FROM Members m 
JOIN Loans l ON m.member_id = l.member_id 
JOIN Books b ON l.book_id = b.book_id;

-- 08
SELECT g.genre_name 
FROM Genres g 
INNER JOIN Book_genres bg ON g.genre_id = bg.genre_id 
INNER JOIN Books b ON bg.book_id = b.book_id 
WHERE b.title = 'The Hobbit';

-- 09
SELECT first_name, last_name 
FROM Authors 
WHERE birth_date > '1940-01-01';

-- 10
SELECT title, available_copies 
FROM Books 
WHERE available_copies > 0;