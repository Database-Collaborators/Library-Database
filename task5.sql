SET SEARCH_PATH = Library;

-- CRUD = Create, Read, Update, Delete


-- CREATE

-- 1
-- Let's insert new book with its author and genre
WITH new_book AS (
  INSERT INTO Books (Title, PublishedDate, CopiesAvailable) VALUES ('A Room of One`s Own', '1929-09-09', 10) RETURNING BookID
), new_author AS (
  INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('Virginia', 'Woolf', '1882-01-25') RETURNING AuthorID
)
INSERT INTO Books_X_Authors (BookID, AuthorID)
SELECT new_book.BookID, new_author.AuthorID FROM new_book, new_author;


-- 2
-- Let's insert a new genre and assign it too certain book
WITH new_genre AS (
  INSERT INTO Genres (GenreName) VALUES ('Historical Fiction') RETURNING GenreID
)
INSERT INTO Books_X_Genres (BookID, GenreID)
VALUES (1, (SELECT GenreID FROM new_genre));


-- READ

-- 3
-- Let's find books with their authors, genres, and total number of reviews:
SELECT b.Title, a.FirstName || ' ' || a.LastName AS Author, g.GenreName, COUNT(r.BookID) AS ReviewCount
FROM Books b
JOIN Books_X_Authors ba ON b.BookID = ba.BookID
JOIN Authors a ON ba.AuthorID = a.AuthorID
JOIN Books_X_Genres bg ON b.BookID = bg.BookID
JOIN Genres g ON bg.GenreID = g.GenreID
LEFT JOIN Reviews r ON b.BookID = r.BookID
GROUP BY b.Title, Author, g.GenreName;


-- 4
-- Let's show all the clients who have borrowed a certain book:
SELECT c.FirstName, c.LastName
FROM Clients c
WHERE EXISTS (
  SELECT 1 FROM Transactions t
  WHERE t.ClientEmail = c.ClientEmail AND t.BookID = 1 AND t.Type = 'Borrow'
);


-- UPDATE

-- 5
-- Let's update the number of copies available for books based on their review ratings (i.e. wee have bought more great books):
UPDATE Books
SET CopiesAvailable = CopiesAvailable + 1
WHERE BookID IN (
  SELECT BookID FROM Reviews
  WHERE Rating > 8
);

-- 6
-- Let's increase the rating of the most recent review for a specific book:
UPDATE Reviews
SET Rating = Rating + 1
WHERE (BookID, ClientEmail) IN (
  SELECT BookID, ClientEmail
  FROM ReviewsHistory
  WHERE BookID = 1
  ORDER BY ReviewTime DESC
  LIMIT 1
) AND Rating < 10;  -- filter for max rating


-- DELETE

-- 7
-- Let's delete clients who have not made any transactions in the past year (old clients):
DELETE FROM Clients
WHERE ClientEmail NOT IN (
  SELECT ClientEmail FROM Transactions
  WHERE TransactionTime > CURRENT_DATE - INTERVAL '1 year'
);

-- 8
-- Let's delete all transactions for books that are no longer available:
DELETE FROM Transactions
WHERE BookID IN (
  SELECT BookID FROM Books
  WHERE CopiesAvailable = 0
);

