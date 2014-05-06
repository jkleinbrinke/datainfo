SELECT p.pid FROM Person p
	WHERE EXISTS(
		SELECT * FROM Writes w
		WHERE p.pid = w.pid
		AND NOT EXISTS(
			SELECT * FROM Directs d
			WHERE d.mid = w.mid
)
);
