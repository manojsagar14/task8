Here's a complete and structured `README.md` file based on your execution of **Task 8: Stored Procedures and Functions** using the `library` table:

---

````markdown
# 📚 Task 8: Stored Procedures and Functions

## 🎯 Objective

To demonstrate the use of **Stored Procedures** and **Functions** in SQL to modularize logic for reusability and better organization.

---

## 🛠 Tools Used

- MySQL Workbench
- MySQL CLI (Command Line Interface)

---

## 📘 Table: `library`

This table contains records of books in a library.

| BookID | Title                    | Author          | Genre         | Year | Copies |
|--------|--------------------------|------------------|---------------|------|--------|
| 1      | The Alchemist            | Paulo Coelho     | Fiction       | 1988 | 5      |
| 2      | To Kill a Mockingbird    | Harper Lee       | Classic       | 1960 | 3      |
| 3      | The Theory of Everything | Stephen Hawking  | Science       | 2002 | 4      |
| 4      | Wings of Fire            | Naveen           | Autobiography | 1999 | 2      |
| 5      | The Hobbit               | J.R.R. Tolkien   | Fantasy       | 1937 | 6      |

---

## 🧩 Stored Procedure: `GetBooksByGenre`

### 🔹 Purpose:
To fetch books that belong to a specific genre.

### 📜 Definition:

```sql
DELIMITER $$

CREATE PROCEDURE GetBooksByGenre(IN genre_name VARCHAR(50))
BEGIN
    SELECT Title, Author, Year, Copies
    FROM library
    WHERE Genre = genre_name;
END $$

DELIMITER ;
````

### ▶️ Execution:

```sql
CALL GetBooksByGenre('Fiction');
```

### ✅ Output:

| Title         | Author       | Year | Copies |
| ------------- | ------------ | ---- | ------ |
| The Alchemist | Paulo Coelho | 1988 | 5      |

---

## 🔢 Function: `TotalCopiesBeforeYear`

### 🔹 Purpose:

To return the total number of copies of books published before a given year.

### 📜 Definition:

```sql
DELIMITER $$

CREATE FUNCTION TotalCopiesBeforeYear(limit_year INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT SUM(Copies) INTO total
    FROM library
    WHERE Year < limit_year;
    RETURN IFNULL(total, 0);
END $$

DELIMITER ;
```

### ▶️ Execution:

```sql
SELECT TotalCopiesBeforeYear(1990) AS Copies_Before_1990;
```

### ✅ Output:

| Copies\_Before\_1990 |
| -------------------- |
| 14                   |



---

Let me know if you want to add a section for [**author-wise search**](f) or maybe a [**procedure to add new books**](f) too!
```
