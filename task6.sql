SET SEARCH_PATH = Library;


-- Клиенты, которые написали не менее 3 отзывов (возможно на одну книгу) --
SELECT
    Clients.ClientEmail,
    Clients.FirstName,
    Clients.LastName,
    COUNT(ReviewsHistory.ClientEmail) AS NumberOfReviews
FROM Clients
LEFT JOIN ReviewsHistory ON Clients.ClientEmail = ReviewsHistory.ClientEmail
GROUP BY Clients.ClientEmail
HAVING COUNT(ReviewsHistory.ClientEmail) >= 3
ORDER BY NumberOfReviews DESC;
-- Expected result:
--      mike.brown@email.com,   Mike,   Brown,  4
--      john.doe@gmail.com,     John,   Doe,    3


-- 3 клиента, которые взяли наибольшее число книг (возможно одинаковых книг) --
SELECT
    ROW_NUMBER() OVER (ORDER BY COUNT(Clients.ClientEmail) DESC) AS rank,
    Clients.ClientEmail,
    Clients.FirstName,
    Clients.LastName,
    COUNT(Clients.ClientEmail) AS NumberOfBorrowings
FROM Clients
JOIN Transactions ON Clients.ClientEmail = Transactions.ClientEmail
WHERE Transactions.Type = 'Borrow'
GROUP BY Clients.ClientEmail
ORDER BY NumberOfBorrowings DESC
LIMIT 3;
-- Expected result:
--      1,  lisa.white@email.com,   ,       ,       4
--      2,  alex.jones@email.com,   Alex,   Jones,  3
--      3,  john.doe@gmail.com,     John,   Doe,    3


-- Выборка из 3 книг с наивысшим средним рейтингом --
SELECT
    DENSE_RANK() OVER (ORDER BY AVG(Reviews.Rating) DESC) AS Rank,
    Books.Title,
    AVG(Reviews.Rating) AS Rating
FROM Books
JOIN Reviews ON Books.BookID = Reviews.BookID
GROUP BY Books.BookId
ORDER BY Rank
LIMIT 3;
-- Expected result:
--      1,  Animal Farm,                10
--      1,  A Summer in the Red Scarf,  10
--      2,  Pride and Prejudice,        9


-- Распределение отзывов клиентов по месяцам  --
SELECT
    ClientEmail,
    TO_CHAR(ReviewTime, 'Month YYYY') AS MonthYear,
    COUNT(ClientEmail) AS ReviewCount
FROM ReviewsHistory
GROUP BY ClientEmail, MonthYear
ORDER BY ClientEmail, MonthYear;
-- Expected result:
--      alex.jones@email.com,   March     2023,     2
--      john.doe@gmail.com,     January   2023,     3
--      lisa.white@email.com,   April     2023,     2
--      mike.brown@email.com,   August    2023,     1
--      mike.brown@email.com,   February  2023,     1
--      mike.brown@email.com,   March     2023,     1
--      mike.brown@email.com,   May       2023,     1


-- Кумулятивная сумма количества аренд для каждой книги в течении времени
SELECT
    B.Title,
    T.TransactionTime,
    COUNT(*) OVER (PARTITION BY T.BookID ORDER BY T.TransactionTime) AS CumulativeTransactions
FROM Transactions T
JOIN Books B ON B.Bookid = T.Bookid
WHERE T.Type = 'Borrow';
-- Expected result:
--      1984,                   2023-01-03,     1
--      Pride and Prejudice,    2023-01-03,     1
--      Pride and Prejudice,    2023-01-15,     2
--      Pride and Prejudice,    2023-12-19,     3
--      Animal Farm,            2023-05-04,     1
--      Animal Farm,            2023-05-05,     2
--      Animal Farm,            2023-12-19,     3
--      Anna Karenina,          2023-04-04,     1
--      Sevastopol Sketches,    2023-02-14,     1
--      The Lord of the Rings,  2023-04-04,     1
--      To Kill a Mockingbird,  2023-12-20,     1


-- Любимая книга каждого клиента (т.е. книга, которой он поставил наивысший отзыв)
WITH RankedReviews AS (
    SELECT
        ClientEmail,
        BookID,
        Rating,
        ROW_NUMBER() OVER (PARTITION BY ClientEmail ORDER BY Rating DESC) AS Rank
    FROM Reviews
)
SELECT
    C.FirstName,
    C.LastName,
    B.Title AS FavoriteBook
FROM RankedReviews R
JOIN Clients C ON R.ClientEmail = C.ClientEmail
JOIN Books B ON R.BookID = B.BookID
WHERE R.Rank = 1;
-- Expected result:
--      Alex,   Jones,      Pride and Prejudice
--      John,   Doe,        1984
--      ,       ,           The Da Vinci Code
--      Mike,   Brown,      Animal Farm

