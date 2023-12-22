SET SEARCH_PATH = Library;


--Clients Table
INSERT INTO Clients (ClientEmail, FirstName, LastName, Password) VALUES ('john.doe@gmail.com', 'John', 'Doe', 'tTZR52Uy=3^G7Yr)');
INSERT INTO Clients (ClientEmail, FirstName, LastName, Password) VALUES ('alex.jones@email.com', 'Alex', 'Jones', 'rg,~Q}_4A6eV8x;*[d');
INSERT INTO Clients (ClientEmail, FirstName, LastName, Password) VALUES ('mike.brown@email.com', 'Mike', 'Brown', 'q}jDgSrJWx@y:LN(83U');
INSERT INTO Clients (ClientEmail, LastName, Password) VALUES ('jane.smith@edu.hse.ru', 'Smith', 'zL*x2sSD]WN6eq3P');
INSERT INTO Clients (ClientEmail, Password) VALUES ('lisa.white@email.com', 'zE3K2m');


--Books Table
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('1984', '1949-06-08', 10);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('War and Peace', '1867-01-09', 1);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('Pride and Prejudice', '1813-01-28', 7);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('The Da Vinci Code', '2003-03-18', 30);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('Animal Farm', '1945-08-17', 2);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('Anna Karenina', '1877-06-25', 11);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('Sevastopol Sketches', '1855-07-12', 1);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('The Hitchhikers Guide to the Galaxy', '1979-10-12', 3);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('The Lord of the Rings', '1954-07-29', 2);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('The Talisman', '1984-11-08', 6);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('The Shining', '1977-01-28', 6);
INSERT INTO Books (Title, CopiesAvailable) VALUES ('To Kill a Mockingbird', 1);
INSERT INTO Books (Title, CopiesAvailable) VALUES ('Bible', 12);
INSERT INTO Books (Title, CopiesAvailable) VALUES ('The Adventures of Sherlock Holmes', 6);
INSERT INTO Books (Title, CopiesAvailable) VALUES ('Woe from Wit', 3);
INSERT INTO Books (Title, CopiesAvailable) VALUES ('The Lost World', 3);
INSERT INTO Books (Title, CopiesAvailable) VALUES ('A General Introduction to Psychoanalysis', 2);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('A Summer in the Red Scarf', '2021-08-15', 8);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('What Is The Swallow Silent About', '2022-08-15', 6);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('The Doings of Raffles Haw', '1891-01-01', 3);
INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('The Complete Sherlock Holmes', '1991-12-02', 1);


--Authors Table
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('Harper', 'Lee', '1926-04-28');
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('Leo', 'Tolstoy', '1828-09-09');
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('Jane', 'Austen', '1775-12-16');
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('Adams', 'Douglas', '1952-03-11');
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('John', 'Tolkin', '1952-03-11');
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('Stephen', 'King', '1947-09-21');
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('Peter', 'Straub', '1943-03-02');
INSERT INTO Authors (FirstName, BirthDate) VALUES ('Dan', '1964-06-22');
INSERT INTO Authors (FirstName, LastName) VALUES ('George', 'Orwell');
INSERT INTO Authors DEFAULT VALUES;
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('Arthur Conan', 'Doyle', '1859-05-22');
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('Alexandre', 'Griboyedov', '1795-01-15');
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('Sigmund', 'Freud', '1856-05-06');
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('Katerina', 'Silvanova', '1992-05-16');
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('Elena', 'Malisova', '1986-05-18');


--Genres Table
INSERT INTO Genres (GenreName) VALUES ('Social Science Fiction');
INSERT INTO Genres (GenreName) VALUES ('Fiction');
INSERT INTO Genres (GenreName) VALUES ('Novel');
INSERT INTO Genres (GenreName) VALUES ('Fantasy');
INSERT INTO Genres (GenreName) VALUES ('Mystery');
INSERT INTO Genres (GenreName) VALUES ('Horror');
INSERT INTO Genres (GenreName) VALUES ('Religion');
INSERT INTO Genres (GenreName) VALUES ('History');
INSERT INTO Genres (GenreName) VALUES ('Detective');
INSERT INTO Genres (GenreName) VALUES ('Comedy');
INSERT INTO Genres (GenreName) VALUES ('Science fiction');
INSERT INTO Genres (GenreName) VALUES ('Philosophy');


--Books_X_Authors Table
--Linking books to authors:
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (1, 9);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (2, 2);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (3, 3);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (4, 8);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (5, 9);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (6, 2);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (7, 2);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (8, 4);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (9, 5);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (10, 6);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (10, 7);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (11, 6);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (12, 1);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (13, 10);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (14, 11);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (15, 12);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (16, 11);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (17, 13);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (18, 14);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (18, 15);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (19, 15);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (19, 14);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (20, 11);
INSERT INTO Books_X_Authors (BookID, AuthorID) VALUES (21, 11);


--Books_X_Genres Table
--Linking books to genres:
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (1, 1);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (2, 3);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (3, 4);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (4, 5);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (5, 1);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (6, 3);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (7, 3);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (8, 2);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (9, 4);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (10, 6);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (11, 6);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (12, 2);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (13, 7);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (13, 8);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (14, 9);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (15, 10);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (16, 11);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (17, 12);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (18, 2);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (19, 3);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (20, 2);
INSERT INTO Books_X_Genres (BookID, GenreID) VALUES (21, 9);


--Transactions Table
--Sample transactions:
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (1, 'john.doe@gmail.com', '2023-01-01', 'Reserve');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (1, 'john.doe@gmail.com', '2023-01-03', 'Borrow');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (1, 'john.doe@gmail.com', '2023-01-12', 'Expansion');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (1, 'john.doe@gmail.com', '2023-01-16', 'Return');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (3, 'john.doe@gmail.com', '2023-01-15', 'Borrow');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (3, 'john.doe@gmail.com', '2023-01-19', 'Return');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (7, 'john.doe@gmail.com', '2023-02-14', 'Borrow');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (3, 'alex.jones@email.com', '2023-01-03', 'Borrow');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (3, 'alex.jones@email.com', '2023-01-07', 'Return');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (6, 'lisa.white@email.com', '2023-04-04', 'Borrow');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (9, 'lisa.white@email.com', '2023-04-04', 'Borrow');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (5, 'lisa.white@email.com', '2023-05-04', 'Borrow');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (5, 'mike.brown@email.com', '2023-05-05', 'Borrow');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (5, 'mike.brown@email.com', '2023-05-08', 'Return');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (3, 'alex.jones@email.com', '2023-12-19', 'Borrow');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (5, 'alex.jones@email.com', '2023-12-19', 'Borrow');
INSERT INTO Transactions (BookID, ClientEmail, TransactionTime, Type) VALUES (12, 'lisa.white@email.com', '2023-12-20', 'Borrow');


--Reviews Table
--Clients reviewing books:
INSERT INTO Reviews (BookID, ClientEmail, Rating, Comment) VALUES (1, 'john.doe@gmail.com', 8, 'Great book!');
INSERT INTO Reviews (BookID, ClientEmail, Rating, Comment) VALUES (2, 'jane.smith@edu.hse.ru', 7, 'Very informative.');
INSERT INTO Reviews (BookID, ClientEmail, Rating, Comment) VALUES (4, 'lisa.white@email.com', 6, 'Interesting read.');
INSERT INTO Reviews (BookID, ClientEmail, Rating, Comment) VALUES (5, 'mike.brown@email.com', 10, 'Best book ever!');
INSERT INTO Reviews (BookID, ClientEmail, Rating) VALUES (3, 'alex.jones@email.com', 9);
INSERT INTO Reviews (BookID, ClientEmail, Rating, Comment) VALUES (18, 'mike.brown@email.com', 10, 'A terrible book!! Promotes LGBT! ');


--ReviewsHistory Table
--History of reviews made by clients:
INSERT INTO ReviewsHistory (BookID, ClientEmail, ReviewTime, Rating, Comment) VALUES (1, 'john.doe@gmail.com', '2023-01-10 10:23:00', 8, 'Great book!');
INSERT INTO ReviewsHistory (BookID, ClientEmail, ReviewTime, Rating, Comment) VALUES (2, 'jane.smith@edu.hse.ru', '2023-02-20 11:01:00', 7, 'Very informative.');
INSERT INTO ReviewsHistory (BookID, ClientEmail, ReviewTime, Rating, Comment) VALUES (2, 'lisa.white@email.com', '2023-04-15 13:00:00', 6, 'Interesting read.');
INSERT INTO ReviewsHistory (BookID, ClientEmail, ReviewTime, Rating, Comment) VALUES (5, 'mike.brown@email.com', '2023-05-25 14:35:00', 10, 'Best book ever!');
INSERT INTO ReviewsHistory (BookID, ClientEmail, ReviewTime, Rating, Comment) VALUES (7, 'john.doe@gmail.com', '2023-01-08 13:30:00', 8, 'Great book!');
INSERT INTO ReviewsHistory (BookID, ClientEmail, ReviewTime, Rating, Comment) VALUES (9, 'alex.jones@email.com', '2023-03-21 12:11:00', 9, 'Loved it!');
INSERT INTO ReviewsHistory (BookID, ClientEmail, ReviewTime, Rating, Comment) VALUES (9, 'lisa.white@email.com', '2023-04-13 13:30:00', 6, 'Interesting read.');
INSERT INTO ReviewsHistory (BookID, ClientEmail, ReviewTime, Rating, Comment) VALUES (13, 'mike.brown@email.com', '2023-08-20 16:59:00', 10, 'Bible is holy!');
INSERT INTO ReviewsHistory (BookID, ClientEmail, ReviewTime, Rating, Comment) VALUES (1, 'john.doe@gmail.com', '2023-01-08 09:02:00', 1, 'Terrible!');
INSERT INTO ReviewsHistory (BookID, ClientEmail, ReviewTime, Rating, Comment) VALUES (5, 'mike.brown@email.com', '2023-02-25 14:07:00', 9, 'Best book!');
INSERT INTO ReviewsHistory (BookID, ClientEmail, ReviewTime, Rating) VALUES (3, 'alex.jones@email.com', '2023-03-30 12:10:00', 9);
INSERT INTO ReviewsHistory (BookID, ClientEmail, ReviewTime, Rating, Comment) VALUES (18, 'mike.brown@email.com', '2023-03-12 19:15:00', 10, 'A terrible book!! Promotes LGBT! ');
