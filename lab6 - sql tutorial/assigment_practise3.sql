-- Practice Queries 3
DROP DATABASE IF EXISTS practive_test;
CREATE DATABASE IF NOT EXISTS practive_test;
USE practive_test;

-- Creating the Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE
);

-- Creating the Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    Genre VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- 1. Retrieve the titles of all books along with their author's last name.
-- 2. Find the total number of books available in each genre.
-- 3. List the authors who have written more than one book.
-- 4. Retrieve the titles of books with a price greater than $10.
-- 5. Create a stored procedure to increase the stock of a specific book by a given amount.
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
