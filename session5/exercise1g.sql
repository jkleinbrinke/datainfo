CREATE TABLE bestelling(
	isbn INT,
	aantal INT,
	FOREIGN KEY (isbn) REFERENCES boek(isbn) ON UPDATE cascade ON DELETE cascade
);


CREATE FUNCTION voegbestellingtoe() 
RETURNS TRIGGER
AS $$ BEGIN
	IF( 1 = (SELECT COUNT(auteur) FROM boek WHERE NEW.auteur = boek.auteur)) THEN
	INSERT INTO bestelling(isbn, aantal)
	VALUES(NEW.isbn, 0);
	END IF;
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER voegbestellingentoe AFTER INSERT ON boek
FOR EACH ROW EXECUTE PROCEDURE voegbestellingtoe();