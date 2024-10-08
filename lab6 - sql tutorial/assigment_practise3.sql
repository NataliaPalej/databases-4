-- Practice Queries 3
DROP DATABASE IF EXISTS practive_test;
CREATE DATABASE IF NOT EXISTS practive_test;
USE practive_test;

drop table if exists authors;
drop table if exists books;

-- Creating the Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE
);

-- Creating the Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    AuthorID INT,
    Genre VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Insert random data into Authors table
INSERT INTO Authors (FirstName, LastName, DateOfBirth)
VALUES 
('George', 'Orwell', '1903-01-01'),
('Jane', 'Austen', '1775-01-01'),
('Mark', 'Twain', '1835-01-01'),
('F. Scott', 'Fitzgerald', '1896-01-01'),
('J.K.', 'Rowling', '1965-01-01'),
('Stephen', 'King', '1947-01-01'),
('Agatha', 'Christie', '1890-01-01'),
('Isaac', 'Asimov', '1920-01-01'),
('Harper', 'Lee', '1926-01-01'),
('Ray', 'Bradbury', '1920-01-01');

-- Insert random data into Books table
INSERT INTO Books (Title, AuthorId, Genre, Price, Stock)
VALUES 
('1984', 1, 'Dystopian', 9.99, 50),
('Pride and Prejudice', 2, 'Romance', 12.99, 30),
('The Adventures of Tom Sawyer', 3, 'Adventure', 7.99, 20),
('The Great Gatsby', 4, 'Classic', 10.99, 15),
('Harry Potter and the Sorcerer''s Stone', 5, 'Fantasy', 19.99, 60),
('The Shining', 6, 'Horror', 14.99, 25),
('Murder on the Orient Express', 7, 'Mystery', 11.99, 18),
('I, Robot', 8, 'Science Fiction', 15.99, 10),
('To Kill a Mockingbird', 9, 'Classic', 9.49, 22),
('Fahrenheit 451', 10, 'Dystopian', 8.99, 16);

INSERT INTO Books (Title, AuthorId, Genre, Price, Stock)
VALUES 
('777', 1, 'Dystopian', 12.99, 50),
('Moj i Moja', 2, 'Romance', 18.99, 30),
('Zloty Prosiaczzek', 3, 'Adventure', 4.99, 3);

select * from books;
select * from authors;

-- 1. Retrieve the titles of all books along with their author's last name.
select a.LastName, b.Title from authors a join books b on a.AuthorID=b.AuthorID;

-- 2. Find the total number of books available in each genre.
select Genre, count(Genre) as "TotalCount" from books group by Genre;

-- 3. List the authors who have written more than one book.
select a.FirstName, a.LastName, count(b.bookID) as "TotalBooks" from authors a join books b on a.AuthorID=b.AuthorID group by a.AuthorID having count(b.bookID) > 1;

-- 4. Retrieve the titles of books with a price greater than $10.
select Title, Price from books where Price > 10;

-- 5. Create a stored procedure to increase the stock of a specific book by a given amount.
drop procedure if exists sp_addStock;
delimiter //
create procedure sp_addStock(
bookToUpdate int,
newStock int
)
begin
update books set Stock=Stock+newStock where BookID=bookToUpdate;
end //
delimiter ;
select * from books where BookID=1;
call sp_addStock(1, 60)

-- 6. Create a function that returns the average price of books in the database.


-- 7. Create a view that shows all books along with their authors and prices.


-- 8. Explain how you would analyze the performance of a query that retrieves all books.


-- 9. Describe the structure of the Books table and its columns.


-- 10. Create a trigger that updates the stock count of a book when a sale is made.


-- 11. Retrieve all authors and their respective books, including those who have no books.


-- 12. Get the total revenue generated from books in the "Fiction" genre.


-- 13. List the titles of books that have more than 2 copies in stock.


-- 14. Retrieve all authors born after 1900.


-- 15. Find the book with the highest price.
-- 16. Combine the titles of books from both Fiction and Dystopian genres in a single result set.
-- 17. Count the number of books in each genre and display it alongside the genre name.
-- 18. Retrieve the titles of books that have a price lower than the average price of all books.
-- 19. Retrieve the titles of all books ordered by price in descending order.
-- 20. Find all books whose title contains the word "the" and display the count of such books.
