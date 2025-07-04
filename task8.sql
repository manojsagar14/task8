mysql> use library;
Database changed
mysql> select * from library;
+--------+--------------------------+-----------------+---------------+------+--------+
| BookID | Title                    | Author          | Genre         | Year | Copies |
+--------+--------------------------+-----------------+---------------+------+--------+
|      1 | The Alchemist            | Paulo Coelho    | Fiction       | 1988 |      5 |
|      2 | To Kill a Mockingbird    | Harper Lee      | Classic       | 1960 |      3 |
|      3 | The Theory of Everything | Stephen Hawking | Science       | 2002 |      4 |
|      4 | Wings of Fire            | Naveen          | Autobiography | 1999 |      2 |
|      5 | The Hobbit               | J.R.R. Tolkien  | Fantasy       | 1937 |      6 |
+--------+--------------------------+-----------------+---------------+------+--------+
5 rows in set (0.00 sec)

mysql> DELIMITER $$
mysql>
mysql> CREATE PROCEDURE GetBooksByGenre(IN genre_name VARCHAR(50))
    -> BEGIN
    ->     SELECT Title, Author, Year, Copies
    ->     FROM library
    ->     WHERE Genre = genre_name;
    -> END $$
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> DELIMITER ;
mysql> CALL GetBooksByGenre('Fiction');
+---------------+--------------+------+--------+
| Title         | Author       | Year | Copies |
+---------------+--------------+------+--------+
| The Alchemist | Paulo Coelho | 1988 |      5 |
+---------------+--------------+------+--------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.02 sec)

mysql> DELIMITER $$
mysql>
mysql> CREATE FUNCTION TotalCopiesBeforeYear(limit_year INT)
    -> RETURNS INT
    -> DETERMINISTIC
    -> BEGIN
    ->     DECLARE total INT;
    ->     SELECT SUM(Copies) INTO total
    ->     FROM library
    ->     WHERE Year < limit_year;
    ->     RETURN IFNULL(total, 0);
    -> END $$
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> DELIMITER ;
mysql> SELECT TotalCopiesBeforeYear(1990) AS Copies_Before_1990;
+--------------------+
| Copies_Before_1990 |
+--------------------+
|                 14 |
+--------------------+
1 row in set (0.01 sec)