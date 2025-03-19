CREATE DATABASE Bookstore;
CREATE SCHEMA Sales;

CREATE TABLE Books (
	book_id int primary key,
    title varchar(100),
    author varchar(100),
    price int,
    quantity int
);

INSERT INTO Books ( book_id, title, author, price, quantity )
VALUES 
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 10.99, 30),
(2, '1984', 'George Orwell', 8.99, 50),
(3, 'To Kill a Mockingbird', 'Harper Lee', 12.49, 40),
(4, 'Pride and Prejudice', 'Jane Austen', 6.99, 20),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 9.99, 35),
(6, 'Moby Dick', 'Herman Melville', 14.99, 25),
(7, 'War and Peace', 'Leo Tolstoy', 18.99, 15),
(8, 'The Odyssey', 'Homer', 7.49, 40),
(9, 'Crime and Punishment', 'Fyodor Dostoevsky', 11.49, 20),
(10, 'The Hobbit', 'J.R.R. Tolkien', 13.99, 50),
(11, 'Brave New World', 'Aldous Huxley', 10.49, 30),
(12, 'The Brothers Karamazov', 'Fyodor Dostoevsky', 16.99, 10),
(13, 'Frankenstein', 'Mary Shelley', 5.99, 45),
(14, 'Don Quixote', 'Miguel de Cervantes', 19.99, 18),
(15, 'Dracula', 'Bram Stoker', 9.49, 60);