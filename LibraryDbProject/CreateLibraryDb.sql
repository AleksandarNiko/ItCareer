CREATE DATABASE Library;
USE Library;

CREATE TABLE Authors(
author_id int auto_increment Primary key,
first_name varchar(100) not null,
last_name varchar(100) not null,
birth_date DATE
);

create table Books(
book_id int auto_increment primary key,
title varchar(255) not null,
author_id int,
publish_date date,
available_copies int default 0,
foreign key(author_id) references Authors(author_id) 
);

create table Genres(
genre_id int auto_increment primary key,
genre_name varchar(100) not null
);

create table Members(
member_id int auto_increment primary key,
first_name varchar(100) not null,
last_name varchar(100) not null,
email varchar(100) not null unique,
membership_date DATETIME default current_timestamp 
);

create table Loans(
loan_id int auto_increment primary key,
book_id int,
member_id int,
loan_date DATETime default current_timestamp,
return_date DATE,
foreign key(book_id) references Books(book_id),
foreign key(member_id) references Members(member_id)	
);

create table Book_genres(
book_id int,
genre_id int,
Primary key(book_id,genre_id),
constraint foreign key(book_id) references Books(book_id),
constraint foreign key(genre_id) references Genres(genre_id)
);

INSERT INTO Authors (first_name, last_name, birth_date)
VALUES
('J.K.', 'Rowling', '1965-07-31'),
('George', 'Orwell', '1903-06-25'),
('J.R.R.', 'Tolkien', '1892-01-03'),
('Agatha', 'Christie', '1890-09-15'),
('Isaac', 'Asimov', '1920-01-02'),
('Stephen', 'King', '1947-09-21'),
('Margaret', 'Atwood', '1939-11-18'),
('Ray', 'Bradbury', '1920-08-22'),
('Haruki', 'Murakami', '1949-01-12'),
('Kurt', 'Vonnegut', '1922-11-11');
      
INSERT INTO Books (title, author_id, publish_date, available_copies)
VALUES
('Harry Potter and the Philosopher\'s Stone', 1, '1997-06-26', 12),
('1984', 2, '1949-06-08', 8),
('The Hobbit', 3, '1937-09-21', 10),
('Murder on the Orient Express', 4, '1934-01-01', 5),
('Foundation', 5, '1951-06-01', 7),
('The Shining', 6, '1977-01-28', 6),
('The Handmaid\'s Tale', 7, '1985-09-01', 9),
('Fahrenheit 451', 8, '1953-10-19', 8),
('Norwegian Wood', 9, '1987-09-04', 10),
('Slaughterhouse-Five', 10, '1969-03-31', 4);
      
INSERT INTO Genres (genre_name)
VALUES
('Fantasy'),
('Dystopian'),
('Mystery'),
('Science Fiction'),
('Horror'),
('Thriller'),
('Historical Fiction'),
('Romance'),
('Adventure'),
('Literary Fiction');
      
INSERT INTO Members (first_name, last_name, email)
VALUES
('Alice', 'Johnson', 'alice.johnson@email.com'),
('Bob', 'Smith', 'bob.smith@email.com'),
('Charlie', 'Davis', 'charlie.davis@email.com'),
('David', 'Miller', 'david.miller@email.com'),
('Eva', 'White', 'eva.white@email.com'),
('Frank', 'Garcia', 'frank.garcia@email.com'),
('Grace', 'Martinez', 'grace.martinez@email.com'),
('Hannah', 'Brown', 'hannah.brown@email.com'),
('Ian', 'Taylor', 'ian.taylor@email.com'),
('Jasmine', 'Wilson', 'jasmine.wilson@email.com');
      
INSERT INTO Loans (book_id, member_id, loan_date, return_date)
VALUES
(1, 1, '2025-01-01', '2025-02-01'),
(2, 2, '2025-01-02', '2025-02-02'),
(3, 3, '2025-01-03', '2025-02-03'),
(4, 4, '2025-01-04', '2025-02-04'),
(5, 5, '2025-01-05', '2025-02-05'),
(6, 6, '2025-01-06', '2025-02-06'),
(7, 7, '2025-01-07', '2025-02-07'),
(8, 8, '2025-01-08', '2025-02-08'),
(9, 9, '2025-01-09', '2025-02-09'),
(10, 10, '2025-01-10', '2025-02-10');
      
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO Book_Genres (book_id, genre_id)
VALUES
(1, 1),  -- Harry Potter is Fantasy
(2, 2),  -- 1984 is Dystopian
(3, 1),  -- The Hobbit is Fantasy
(4, 3),  -- Murder on the Orient Express is Mystery
(5, 4),  -- Foundation is Science Fiction
(6, 5),  -- The Shining is Horror
(7, 6),  -- The Handmaid's Tale is Thriller
(8, 4),  -- Fahrenheit 451 is Science Fiction
(9, 1),  -- Norwegian Wood is Fantasy
(10, 10); -- Slaughterhouse-Five is Literary Fiction
      
SELECT b.title, a.first_name AS author_first_name, a.last_name AS author_last_name,
      g.genre_name, m.first_name AS member_first_name, m.last_name AS member_last_name,
      l.loan_date, l.return_date
FROM Loans l
JOIN Books b ON l.book_id = b.book_id
JOIN Authors a ON b.author_id = a.author_id
JOIN Members m ON l.member_id = m.member_id
JOIN Book_Genres bg ON b.book_id = bg.book_id
JOIN Genres g ON bg.genre_id = g.genre_id;