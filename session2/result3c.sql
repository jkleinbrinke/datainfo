SELECT p.name FROM Person p, Writes w
		WHERE p.pid = w.pid
		AND NOT EXISTS(
			SELECT * FROM Directs d
			WHERE d.mid = w.mid
);