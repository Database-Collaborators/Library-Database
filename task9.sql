SET SEARCH_PATH = Library;


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
