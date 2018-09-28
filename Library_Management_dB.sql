CREATE DATABASE db_LibraryManagementSystem;

USE db_LibraryManagementSystem
GO

CREATE TABLE library_branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY,
	BranchName VARCHAR(50) NOT NULL,
	BranchAddress VARCHAR(75) NOT NULL
);

CREATE TABLE publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(75) NOT NULL,
	PublisherPhone VARCHAR(30) NOT NULL
);

CREATE TABLE books (
	BookID INT PRIMARY KEY NOT NULL,
	BookTitle VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES
	publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE book_authors (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(75) NOT NULL
);

CREATE TABLE book_copies (
	BookID INT NOT NULL CONSTRAINT fk_BookID1 FOREIGN KEY REFERENCES books(BookID),
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL 
);

CREATE TABLE borrower (
	CardNo INT PRIMARY KEY NOT NULL,
	Name VARCHAR(75) NOT NULL,
	BorrowerAddress VARCHAR(100) NOT NULL,
	BorrowerPhone VARCHAR(30) NOT NULL
);

CREATE TABLE book_loans (
	BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID1 FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

INSERT INTO library_branch 
(BranchName, BranchAddress)
VALUES 
('Sharpstown', '135 E Main Street Sharpstown, VA 22036'),
('Central', '473 Fargo Street Central, VA 22641'),
('Berryville', '214 Walnut Street Berryville, VA 22611'),
('Leesburg', '713 Edwin Lane Leesburg, VA 22433'),
('Fairfax', '14201 Daly Drive Fairfax, VA 22148')
;

INSERT INTO publisher
(PublisherName, PublisherAddress, PublisherPhone)
VALUES
('Penguin Random House','1745 Broadway New York, New York 10007','(242)784-7710'),
('HarperCollins','195 Broadway New York, New York 10007','(714) 825-9545'),
('Simon & Schuster','1230 6th Ave New York, New York 10020','(917) 554-8563'),
('Hachette Book Group','1290 6th Ave New York, New York','10104'),
('Macmillan','75 Varick St New York, New York 10013','(212) 226-7521'),
('Scholastic','557 Broadway New York, New York 10008','(757) 401-0089'),
('Disney Publishing','44 S Broadway White Plains, New York 10601','(212) 843-5582'),
('Houghton Mifflin Harcourt','3 Park Avenue New York, New York 10016','(917) 284-6653')
;

INSERT INTO books
(BookID, BookTitle, PublisherName)
VALUES
(1, 'The Lost Tribe', 'Houghton Mifflin Harcourt'),
(2, 'The Shining', 'HarperCollins'),
(3, 'Pet Semetary', 'HarperCollins'),
(4, 'IT', 'HarperCollins'),
(5, 'Cats Cradle', 'Macmillan'),
(6, 'The Poisonwood Bible', 'Simon & Schuster'),
(7, 'The Great Gatsby', 'Scholastic'),
(8, 'Great Expectations', 'Penguin Random House'),
(9, 'The Adventures of Huckleberry Finn', 'Disney Publishing'),
(10, 'The Bell Jar', 'Hachette Book Group'),
(11, 'Slaughterhouse Five', 'MacMillan'),
(12, 'Fahrenheit 451', 'Simon & Schuster'),
(13, 'Sharp Objects', 'Hachette Book Group'),
(14, 'Cloud Atlas', 'Scholastic'),
(15, 'The Hobbit', 'Disney Publishing'),
(16, '1Q84', 'HarperCollins'),
(17, 'Siddhartha', 'Houghton Mifflin Harcourt'),
(18, 'Love in the Time of Cholera', 'Hachette Book Group'),
(19, 'Life of Pi', 'Disney Publishing'),
(20, 'The Perks of Being a Wallflower', 'Simon & Schuster'),
(21, 'Middlesex', 'Scholastic'),
(22, 'Into the Water', 'Penguin Random House'),
(23, 'Water for Elephants', 'Macmillan'),
(24, 'All the Pretty Horses', 'Houghton Mifflin Harcourt'),
(25, 'Glass Castle', 'Hachette Book Group')
;

INSERT INTO book_authors
(BookID, AuthorName)
VALUES
(1, 'Mark Collins'),
(2, 'Stephen King'),
(3, 'Stephen King'),
(4, 'Stephen King'),
(5, 'Kurt Vonnegut'),
(6, 'Barbara Kingsolver'),
(7, 'F. Scott Fitzgerald'),
(8, 'Charles Dickens'),
(9, 'Mark Twain'),
(10, 'Sylvia Plath'),
(11, 'Kurt Vonnegut'),
(12, 'Ray Bradbury'),
(13, 'Gillian Flynn'),
(14, 'David Mitchell'),
(15, 'J. R. R. Tolkien'),
(16, 'Haruki Murakami'),
(17, 'Herman Hesse'),
(18, 'Gabriel Garcia Marquez'),
(19, 'Yann Martel'),
(20, 'Stephen Chbosky'),
(21, 'Jeffrey Eugenides'),
(22, 'Paula Hawkins'),
(23, 'Sara Gruen'),
(24, 'Cormac McCarthy'),
(25, 'Jeanette Walls')
;

INSERT INTO book_copies
(BookID, BranchID, Number_Of_Copies)
VALUES
(1, 1, 8),
(2, 1, 8),
(3, 1, 8),
(4, 1, 8),
(5, 1, 8),
(6, 1, 8),
(7, 1, 8),
(8, 1, 8),
(9, 1, 8),
(10, 1, 8),
(11, 1, 8),
(12, 1, 8),
(13, 1, 8),
(14, 1, 8),
(15, 1, 8),
(16, 1, 8),
(17, 1, 8),
(18, 1, 8),
(19, 1, 8),
(20, 1, 8),
(21, 1, 8),
(22, 1, 8),
(23, 1, 8),
(24, 1, 8),
(25, 1, 8),
(1, 2, 7),
(2, 2, 7),
(3, 2, 7),
(4, 2, 7),
(5, 2, 7),
(6, 2, 7),
(7, 2, 7),
(8, 2, 7),
(9, 2, 7),
(10, 2, 7),
(11, 2, 7),
(12, 2, 7),
(13, 2, 7),
(14, 2, 7),
(15, 2, 7),
(16, 2, 7),
(17, 2, 7),
(18, 2, 7),
(19, 2, 7),
(20, 2, 7),
(21, 2, 7),
(22, 2, 7),
(23, 2, 7),
(24, 2, 7),
(25, 2, 7),
(1, 3, 5),
(2, 3, 5),
(3, 3, 5),
(4, 3, 5),
(5, 3, 5),
(6, 3, 5),
(7, 3, 5),
(8, 3, 5),
(9, 3, 5),
(10, 3, 5),
(11, 3, 5),
(12, 3, 5),
(13, 3, 5),
(14, 3, 5),
(15, 3, 5),
(16, 3, 5),
(17, 3, 5),
(18, 3, 5),
(19, 3, 5),
(20, 3, 5),
(21, 3, 5),
(22, 3, 5),
(23, 3, 5),
(24, 3, 5),
(25, 3, 5),
(1, 4, 5),
(2, 4, 5),
(3, 4, 5),
(4, 4, 5),
(5, 4, 5),
(6, 4, 5),
(7, 4, 5),
(8, 4, 5),
(9, 4, 5),
(10, 4, 5),
(11, 4, 5),
(12, 4, 5),
(13, 4, 5),
(14, 4, 5),
(15, 4, 5),
(16, 4, 5),
(17, 4, 5),
(18, 4, 5),
(19, 4, 5),
(20, 4, 5),
(21, 4, 5),
(22, 4, 5),
(23, 4, 5),
(24, 4, 5),
(25, 4, 5),
(1, 5, 5),
(2, 5, 5),
(3, 5, 5),
(4, 5, 5),
(5, 5, 5),
(6, 5, 5),
(7, 5, 5),
(8, 5, 5),
(9, 5, 5),
(10, 5, 5),
(11, 5, 5),
(12, 5, 5),
(13, 5, 5),
(14, 5, 5),
(15, 5, 5),
(16, 5, 5),
(17, 5, 5),
(18, 5, 5),
(19, 5, 5),
(20, 5, 5),
(21, 5, 5),
(22, 5, 5),
(23, 5, 5),
(24, 5, 5),
(25, 5, 5)
;

INSERT INTO borrower
(CardNo, Name, BorrowerAddress, BorrowerPhone)
VALUES
(1, 'Laura Evans', '366 Shepherds Mill Road', '(540) 722-6631'),
(2, 'Ashley Devereaux', '4521 Kidder Drive', '(540) 664-1964'),
(3, 'Shawn Fidler', '1411 Maison Court', '(304) 955-2882'),
(4, 'Amanda James', '237 Apple Blossom Drive', '(703) 378-1010'),
(5, 'Matt Grow', '1806 Margate Court', '(304) 725-0505'),
(6, 'Joe Roberts', '3992 Laskin Road', '(540) 410-5778'),
(7, 'Kylie Petti', '877 Cook Street', '(757) 317-3625'),
(8, 'Will Cook', '548 Williams Avenue', '(304) 841-7772'),
(9, 'Nathan Goodell', '110 West Broadway', '(540) 224-1800')
;

INSERT INTO book_loans
(BookID, BranchID, CardNo, DateOut, DateDue)
VALUES
( 1, 1, 9, '2018-07-05', '2018-07-25'),
( 1, 2, 8, '2018-02-21', '2018-03-13'),
( 2, 3, 7, '2018-03-06', '2018-03-26'),
( 2, 4, 6, '2018-09-27', '2018-10-17'),
( 3, 5, 5, '2018-09-15', '2018-10-05'),
( 3, 1, 4, '2018-05-03', '2018-05-23'),
( 4, 2, 3, '2018-04-13', '2018-05-03'),
( 4, 3, 2, '2018-06-07', '2018-06-27'),
( 5, 4, 1, '2018-09-19', '2018-10-09'),
( 5, 5, 2, '2018-09-09', '2018-09-29'),
( 6, 1, 3, '2018-08-24', '2018-09-14'),
( 6, 2, 2, '2018-01-17', '2018-02-06'),
( 7, 3, 3, '2018-08-11', '2018-08-31'),
( 7, 4, 4, '2018-09-24', '2018-10-14'),
( 8, 5, 7, '2018-07-22', '2018-08-11'),
( 8, 1, 6, '2018-03-17', '2018-04-06'),
( 9, 2, 9, '2018-03-03', '2018-03-23'),
( 9, 3, 6, '2018-02-28', '2018-03-20'),
( 10, 4, 8, '2018-04-20', '2018-05-10'),
( 10, 5, 7, '2018-05-08', '2018-05-28'),
( 11, 5, 7, '2018-06-14', '2018-07-03'),
( 11, 1, 6, '2018-06-15', '2018-07-03'),
( 12, 2, 4, '2018-07-06', '2018-07-26'),
( 12, 3, 3, '2018-09-11', '2018-10-01'),
( 13, 4, 2, '2018-09-10', '2018-09-30'),
( 13, 5, 1, '2018-05-16', '2018-06-05'),
( 14, 1, 5, '2018-01-15', '2018-02-05'),
( 14, 2, 6, '2018-04-26', '2018-05-16'),
( 15, 3, 5, '2018-08-14', '2018-09-03'),
( 15, 4, 4, '2018-07-07', '2018-07-27'),
( 16, 5, 8, '2018-09-28', '2018-10-18'),
( 16, 1, 9, '2018-06-11', '2018-07-01'),
( 17, 2, 9, '2018-01-14', '2018-02-03'),
( 17, 2, 6, '2018-05-31', '2018-06-20'),
( 18, 3, 5, '2018-08-11', '2018-08-31'),
( 18, 4, 6, '2018-04-07', '2018-04-27'),
( 19, 4, 9, '2018-08-03', '2018-08-23'),
( 19, 5, 9, '2018-09-19', '2018-10-09'),
( 20, 5, 7, '2018-02-11', '2018-03-03'),
( 20, 1, 7, '2018-07-08', '2018-07-28'),
( 21, 1, 6, '2018-08-25', '2018-09-14'),
( 21, 2, 6, '2018-06-19', '2018-07-09'),
( 22, 3, 6, '2018-05-31', '2018-06-20'),
( 23, 1, 8, '2018-09-17', '2018-10-07'),
( 22, 2, 4, '2018-06-16', '2018-07-01'),
( 24, 4, 4, '2018-07-01', '2018-07-21'),
( 23, 2, 3, '2018-07-21', '2018-08-11'),
( 24, 3, 2, '2018-09-15', '2018-10-05'),
( 25, 5, 2, '2018-06-23', '2018-07-13'),
( 25, 5, 5, '2018-05-23', '2018-06-13'),
( 2, 5, 5, '2018-09-11', '2018-10-01'),
( 2, 2, 8, '2018-01-07', '2018-01-27'),
( 3, 3, 9, '2018-06-18', '2018-07-08'),
( 4, 1, 9, '2018-05-03', '2018-05-23')
;

CREATE PROC dbo.queryOne
AS
SELECT Number_Of_Copies
FROM book_copies a1
INNER JOIN library_branch a2 ON a2.BranchID = a1.BranchID
INNER JOIN books a3 ON a3.BookID = a1.BookID
WHERE BranchName = 'Sharpstown' AND BookTitle = 'The Lost Tribe'
;

CREATE PROC dbo.queryTwo
AS
SELECT BranchName, Number_Of_Copies
FROM book_copies a1
INNER JOIN books a2 ON a2.BookID = a1.BookID
INNER JOIN library_branch a3 ON a3.BranchID = a1.BranchID
WHERE BookTitle = 'The Lost Tribe'
;

CREATE PROC dbo.queryThree
AS
SELECT Name, COUNT(a2.CardNo)
FROM borrower a1
INNER JOIN book_loans a2 ON a2.CardNo = a1.CardNo
WHERE DateDue BETWEEN '2018-09-27' AND '2018-12-31'
GROUP BY Name
HAVING COUNT(a2.CardNo) = 0
;

CREATE PROC dbo.queryFour
AS
SELECT BookTitle, Name, BorrowerAddress
FROM books a1
INNER JOIN book_loans a2 ON a2.BookID = a1.BookID
INNER JOIN borrower a3 ON a3.CardNo = a2.CardNo
INNER JOIN library_branch a4 on a4.BranchID = a2.BranchID
WHERE BranchName = 'Sharpstown' AND DateDue = '2018-09-28'
;

CREATE PROC dbo.queryFive
AS
SELECT BranchName AS 'Branch Name', COUNT(a2.branchID) AS 'Total Books Loaned:'
FROM library_branch a1
INNER JOIN book_loans a2 ON a2.BranchID = a1.BranchID
GROUP BY BranchName
;

CREATE PROC dbo.querySix
AS
SELECT Name, BorrowerAddress AS 'Address', COUNT(a2.CardNo) AS 'Total Books Borrowed:'
FROM borrower a1
INNER JOIN book_loans a2 ON a2.CardNo = a1.CardNo
WHERE DateDue BETWEEN '2018-09-29' AND '2018-12-31'
GROUP BY Name, BorrowerAddress
;

CREATE PROC dbo.querySeven
AS
SELECT BookTitle, SUM(Number_Of_Copies)
FROM books a1
INNER JOIN Book_Copies a2 ON a2.BookID = a1.BookID
INNER JOIN book_authors a3 ON a3.BookID = a2.BookID
INNER JOIN library_branch a4 ON a4.BranchID = a2.BranchID
WHERE BranchName = 'Central' AND AuthorName = 'Stephen King'
GROUP BY BookTitle
;