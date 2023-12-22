SET SEARCH_PATH = Library;


-- Описание:
-- при добавлении новой записи в таблицу Reviews, 
-- старая запись удаляется из Reviews (с той же книгой того де человека),
-- а также эта новая запись добавляется в ReviewsHistory

CREATE OR REPLACE FUNCTION handle_reviews_insert()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM Reviews
    WHERE BookID = NEW.BookID
    AND ClientEmail = NEW.ClientEmail;

    INSERT INTO ReviewsHistory (BookID, ClientEmail, ReviewTime, Rating, Comment)
    VALUES (NEW.BookID, NEW.ClientEmail, CURRENT_TIMESTAMP, NEW.Rating, NEW.Comment);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER handle_reviews_insert_trigger
BEFORE INSERT ON Reviews
FOR EACH ROW
EXECUTE FUNCTION handle_reviews_insert();




-- Описание:
-- 1) Не дает брать/бронировать книгу, если у человека уже есть такая же
-- 2) Не дает бронировать или брать книгу, если ее нет в наличии
-- 3) Не дает возвращать или продлять книгу если ее нет у человека
-- 4) Не дает бронировать книгу если она была забронирована в течение предыдущих 7 дней

CREATE OR REPLACE FUNCTION check_transaction_validity()
    RETURNS TRIGGER AS
$$
BEGIN

    IF NEW.Type = 'Return' OR NEW.Type = 'Expansion' THEN
        IF NOT EXISTS (SELECT 1
                       FROM (SELECT SUM(CASE WHEN Type = 'Borrow' THEN 1 ELSE 0 END) AS CountBorrow,
                                    SUM(CASE WHEN Type = 'Return' THEN 1 ELSE 0 END) AS CountReturn
                             FROM Transactions
                             WHERE BookID = NEW.BookID
                               AND ClientEmail = NEW.ClientEmail
                             GROUP BY BookID, ClientEmail) AS T
                       WHERE CountBorrow > CountReturn) THEN
            RAISE EXCEPTION 'Книга с BookID % не была взята клиентом %', NEW.BookID, NEW.ClientEmail;
        END IF;
    END IF;


    IF NEW.Type = 'Reserve' OR NEW.Type = 'Borrow' THEN
        IF EXISTS (SELECT 1
                   FROM (SELECT SUM(CASE
                                        WHEN Type = 'Borrow'
                                            THEN 1
                                        ELSE 0 END)                              AS CountBorrow,
                                SUM(CASE WHEN Type = 'Return' THEN 1 ELSE 0 END) AS CountReturn
                         FROM Transactions
                         WHERE BookID = NEW.BookID
                           AND ClientEmail = NEW.ClientEmail
                         GROUP BY BookID, ClientEmail) AS T
                   WHERE CountBorrow > CountReturn) THEN
            RAISE EXCEPTION 'Книга с BookID % уже есть у клиента %', NEW.BookID, NEW.ClientEmail;
        END IF;
    END IF;

    IF NEW.Type = 'Reserve' THEN
        IF EXISTS (SELECT 1
                   FROM (SELECT SUM(CASE
                                        WHEN Type = 'Borrow' OR
                                             (Type = 'Reserve' AND TransactionTime >= CURRENT_DATE - INTERVAL '7 days')
                                            THEN 1
                                        ELSE 0 END)                              AS CountBorrow,
                                SUM(CASE WHEN Type = 'Return' THEN 1 ELSE 0 END) AS CountReturn
                         FROM Transactions
                         WHERE BookID = NEW.BookID
                           AND ClientEmail = NEW.ClientEmail
                         GROUP BY BookID, ClientEmail) AS T
                   WHERE CountBorrow > CountReturn) THEN
            RAISE EXCEPTION 'Книга с BookID % уже забронирована клиентом %', NEW.BookID, NEW.ClientEmail;
        END IF;
    END IF;


    IF NEW.Type = 'Borrow' OR NEW.Type = 'Reserve' THEN
        IF -(SELECT COUNT(*) AS CountReserveNoBorrow
             FROM Transactions T1
             WHERE Type = 'Reserve'
               AND TransactionTime >= CURRENT_DATE - INTERVAL '7 days'
               AND T1.BookID = NEW.BookID
               AND NOT EXISTS (SELECT 1
                               FROM Transactions T2
                               WHERE T2.Type = 'Borrow'
                                 AND T2.BookID = T1.BookID
                                 AND T2.ClientEmail = T1.ClientEmail
                                 AND T2.TransactionTime > T1.TransactionTime)) +
           (SELECT SUM(CASE WHEN Type = 'Return' THEN 1 ELSE 0 END)
            FROM Transactions
            WHERE BookID = NEW.BookID) -
           (SELECT SUM(CASE WHEN Type = 'Borrow' THEN 1 ELSE 0 END)
            FROM Transactions
            WHERE BookID = NEW.BookID) + (SELECT CopiesAvailable
                                          FROM books
                                          WHERE BookID = NEW.BookID) = 0 THEN
            RAISE EXCEPTION 'Книги нет в наличии';
        END IF;
    END IF;
    RETURN NEW;
END;

$$ LANGUAGE plpgsql;

CREATE TRIGGER check_transaction_validity_trigger
    BEFORE INSERT
    ON Transactions
    FOR EACH ROW
EXECUTE FUNCTION check_transaction_validity();
