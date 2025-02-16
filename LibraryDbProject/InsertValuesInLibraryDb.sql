use Library;

INSERT INTO Authors (first_name, last_name, birth_date)
VALUES
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
(3, 3, '2025-01-03', '2025-02-03'),
(4, 4, '2025-01-04', '2025-02-04'),
(5, 5, '2025-01-05', '2025-02-05'),
(6, 6, '2025-01-06', '2025-02-06'),
(7, 7, '2025-01-07', '2025-02-07'),
(8, 8, '2025-01-08', '2025-02-08'),
(9, 9, '2025-01-09', '2025-02-09'),
(10, 10, '2025-01-10', '2025-02-10');

create table Book_genres(
book_id int,
genre_id int,
Primary key(book_id,genre_id),
constraint foreign key(book_id) references Books(book_id),
constraint foreign key(genre_id) references Genres(genre_id)
);
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO book_genres (book_id, genre_id)
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