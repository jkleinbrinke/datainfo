CREATE TABLE boek (
	isbn INT,
	titel VARCHAR(255),
	auteur VARCHAR(100),
	PRIMARY KEY(isbn)
);

CREATE TABLE exemplaar (
	isbn INT,
	volgnummer INT,
	gewicht INT,
	kast INT,
	PRIMARY KEY (isbn, volgnummer), 
	FOREIGN KEY (isbn) REFERENCES boek(isbn) ON UPDATE cascade ON DELETE cascade
);