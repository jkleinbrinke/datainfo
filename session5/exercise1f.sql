CREATE FUNCTION verwijderalles() 
RETURNS TRIGGER
AS $$ BEGIN
	DELETE FROM exemplaar WHERE isbn = OLD.isbn;
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER verwijderexemplaren AFTER DELETE ON boek
FOR EACH ROW EXECUTE PROCEDURE verwijderalles();
