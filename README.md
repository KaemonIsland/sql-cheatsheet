# sql-cheatsheet

A cheat sheet for MySQL/SQL usage.

# Tips

Running commands from the CLI is great and everything. But being able to edit multiple lines, or update complicated commands in the future is so much better!

Use `.sql` files containing SQL commands works the same as typing them within the CLI.

Use the command `source <path_to_file>;` to run commands within the file.

# Databases

## List

`show databases;`

## Create

`CREATE DATABASE <database_name>;`

## Delete

`DROP DATABASE <database_name>;`

## Select/Use

To select a database.

`USE <database_name>;`

Or to show the selected database.

`SELECT database();`

# Tables

## Create

`CREATE TABLE <table_name> ( <column_name> <data_type>, <column_name> <data_type> );`

Specify not null.

`CREATE TABLE <table_name> ( <column_name> <data_type> NOT NULL );`

Default Values.

`CREATE TABLE <table_name> ( <column_name> <data_type> DEFAULT <default_value> );`

Add Primary Key.
Keep values unique by making them primary keys.

`CREATE TABLE <table_name> ( <column_name> <data_type>, <identifier_name> INT NOT NULL, PRIMARY KEY (<identifier_name>) );`

EX.

`CREATE TABLE unique_cats ( cat_id INT NOT NULL AUTO_INCREMENT, // Cannot be null and will auto update the id name VARCHAR(20), age INT, PRIMARY KEY (cat_id) );`

## Delete

`DROP TABLE <table_name>;`

## Show

`SHOW TABLES;`

## Insert

Order matters with params!

`INSERT INTO <table_name>(column_name1, column_name2) VALUES (column_name1, column_name2);`

Can bulk insert data.

`INSERT INTO <table_name>(column_name1, column_name2) VALUES (column_name1, column_name2), (column_name1, column_name2), (column_name1, column_name2);`

# Columns

## Show

`SHOW COLUMNS FROM <table_name>;`

Or with describe

`DESC <table_name>;`

## Select

`SELECT * FROM <table_name>;`

# CRUD Actions

## INSERT (create)

Inserts data into tables

Order matters with params!

`INSERT INTO <table_name>(column_name1, column_name2) VALUES (column_name1, column_name2);`

Can bulk insert data.

`INSERT INTO <table_name>(column_name1, column_name2) VALUES (column_name1, column_name2), (column_name1, column_name2), (column_name1, column_name2);`

## SELECT (Read)

Selects property from table.

Show all items within table

`SELECT * FROM <table_name>`

Show all of one column value within a table

`SELECT <column> FROM <table_name>;`

EX. `SELECT name FROM employees;`

Use a comma to select multiple columns. (order matters)

EX. `SELECT age, name FROM users;`

### ALIAS

You can show data with different names without altering columns using AS.

`SELECT <column_name> AS <desired_name> FROM <table_name>;`

EX.

`SELECT user_id AS id, name FROM employees;`

## WHERE (All)

Specifies what we want to apply actions to.

At the end of a general query add WHERE + requirements.

Searching by string is cas INSENSITIVE. 'Steve' and 'StEvE' will return the same results.

`<query> WHERE <requirements>`

EX

`WHERE name = "steve";`

`WHERE age = 23`

## UPDATE (Update, duh)

ALWAYS try SELECTing before you UPDATE data.

Updates one value to a new value using WHERE.

`UPDATE <table_name> SET <column_name>=<desired_value> WHERE <requirement>;`

EX.

`UPDATE users SET name="Kaemon" WHERE user_id = 23;`

## DELETE (delete, also duh)

Removes data from tables that meet the requirements.

THERE IS NO UNDO BUTTON WITH DELETE.

`DELETE FROM <table_name> WHERE <requirement>;`

Remove all data from a table, not the same as `DROP TABLE <table_name>`.

`DELETE FROM <table_name>;`

# Warnings

## Show

Run this command if you receive a message when inserting data into a table.
Warnings can only be shown immediately after receiving one. Otherwise it will show 0 warnings.

`SHOW WARNINGS;`

# String Functions

Here we can find a list of string functions available to us.

[Current Functions](https://dev.mysql.com/doc/refman/8.0/en/string-functions.html)

The following shows commonly used string functions with examples.

String functions can be combined and nested to get more complex results.

## CONCAT

Combines columns together, you can also include text. This will show the concat used in the column header.

`CONCAT(<column_name>, <column_name2>);`

Ex. `SELECT CONCAT(first_name, ' ', last_name) FROM customers;`

Use `AS` to change the name of the returned data.

Ex. `SELECT CONCAT(first_name, ' ', last_name) AS 'Full Name' FROM employees;`

### CONCAT_WS

First argument is applied between each column as a separator.

`CONCAT_WS(' - ', title, first_name, last_name);`

This will apply `' - '` between all columns.

## SUBSTRING

Return a substring of the first parameter.

NOTE: SQL starts indexes at 1, not 0 like most programming languages.

SUBSTRING(string, start_index, end_index).

EX. `SELECT SUBSTRING('Hello World', 1, 5);`
Return 'Hello'

EX. `SELECT SUBSTRING('Hello World', 7);`
Returns 'World'

## REPLACE

Replaces parts of a string. Replacing is CASE SENSITIVE.

E. `SELECT REPLACE('Hello World', 'Hell', '%$#@');`
Returns `%$#@o World`.

Ex. `SELECT REPLACE('cheese bread coffee milk', ' ', ' and ' );`

## REVERSE

Does what you thing, reverses a string!

Ex. `SELECT REVERSE('Hello World');`
Returns "dlroW olleH"

## CHAR_LENGTH

Returns the length of the string.

Ex. `SELECT CHAR_LENGTH('Hello World');`
Returns 11

## UPPER/LOWER

Changes case text like uppercase and lower case.

Ex. `SELECT UPPER('hello world');`
Returns 'HELLO WORLD'

Ex. `SELECT LOWER('Hello World');`
Returns 'hello world'.

## IFNULL

Replaces null values with a new value.
Useful for displaying more readable data than NULL

Ex. `SELECT IFNULL(first_name, 'Missing') AS 'First Name', IFNULL(last_name, 'Missing') FROM employees;`

# Refining Selections

## DISTINCT

Used with `SELECT` Removes duplicated entries from statements.

`SELECT DISTINCT <columns_name> FROM <table_name>;`

Show all author last names without dups.
Ex. `SELECT DISTINCT author_lname FROM books;`

## ORDER BY

Orders results by specified parameter.

Note: Ascending is used by default. Add `DESC` to the end to reverse.

You can also specify `ASC` but it's not required.

`SELECT * FROM <table_name> ORDER BY <parameter>;`

With `DESC`

`SELECT * FROM <table_name> ORDER BY <parameter> DESC;`

Ex. `SELECT first_name FROM employees ORDER BY first_name;`

You can also specify the param to specify using the select param number.

`SELECT first_name, last_name, title FROM books ORDER BY 2;`

This will order the results by `last_name` because it is the 2nd parameter.

You can also order multiple columns by order listed.

`... ORDER BY first_name, last_name;`

Will order by first name, then within the first name order by last name.

## LIMIT

Limits the amount of queries by a maximum.

`SELECT * FROM <table_name> LIMIT 50`

Only returns first 50 results.

You can also specify the length of rows by including a second param.
This is mainly used for Pagination.

`... LIMIT 0, 3;`

Returns first 3 results starting at the first item.

`... LIMIT 2, 6;`

Returns the 3rd -> 5th items not included the 6th.

If you want to start at a specific point, and return the rest of the data you will need to use a gigantic number!

`... LIMIT 95, 18446744073709551615;`

## LIKE

Better Searching!

Similar to `WHERE`, like searches somewhat matching results.

"I'm looking for an employee, I can't remember their name...
I know it's something like David, maybe Dan?"

This example searches first names that contain 'd' and 'a'. Characters are NOT case sensitive.

Using 'd' will match 'D' and 'd'.

`%` Are wildcards.

`... WHERE first_name LIKE '%da%';`

### WILDCARDS

You can use `\` to escape wildcards.

#### %

Matches any number of characters!

##### \_

Specifies exactly 1 character difference.

Can be used to specify the number of digits.

Phone Numbers matcher
(123)456-7890

`... WHERE phone_number LIKE '(___)___-___';`

# Aggregate Functions

Built in functions that allow us to work with / aggregate lots of data.

Stuff like counting, getting averages, etc.

## Count

Counts the number of returned rows.

`SELECT COUNT(*) FROM <table_name>;`

EX selecting unique first names

`SELECT COUNT(DISTINCT(first_name)) FROM employees;`

## Group By

GROUP BY summarizes or aggregates identical data into single rows.

Ex. `SELECT last_name, COUNT(score) FROM students GROUP BY last_name;`
Returns. Each child as a group with a count of scores.

Ex. `SELECT CONCAT("In ", released_year, " ", COUNT(*), " book(s) released") AS "Year" FROM books GROUP BY released_year ORDER BY released_year DESC;`

## MIN & MAX

Return the Minimum or Maximum values within a table.

Note: Max/Min call are independent from other queries, thus a query will perform max/min first, then other actions.
Ex you want to get the book title that has the most pages. You would get Max pages, and the title from the first book in the DB.

`SELECT MIN(<column_name>) FROM <table_name>;`

Ex `SELECT MAX(income) FROM <employees>;`
returns Max income value.

# SUBQUERIES

Performs a sub query that is required for a second query.
Here, the `WHERE` statement is executed first, then used to find a matching row.

`SELECT * FROM <table_name> WHERE <column_name> = (SELECT Min(<column_name>) FROM <table_name>);`

Ex `SELECT * FROM books WHERE pages = (SELECT MAX(pages) FROM books);`

This method can be slow considering two queries are being made.

## Using `ORDER BY`

Ex `SELECT * FROM <table_name> ORDER BY <column_name> ASC LIMIT 1`

## Using `GROUP BY`

For questions like "Find the year each author published their first book"

Ex `SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;`

## SUM

Sum all numbers within a column.

`SELECT SUM(<int_column>) FROM <table_name>;`

With `GROUP BY`

Ex. Sum all pages each author has written
`SELECT SUM(pages) FROM books GROUP BY author_fname, author_lname;`

## AVG

Gets the average of items within a column.

`SELECT AVG(<column_name>) FROM <table_name>;`

# Data Types

## Strings (Storing Text)

### CHAR

Has a fixed length. Every entry will have the exact same length.

`CHAR(3)`, every string entered will be 3 characters long.

Shorter strings will have spaces added to reach the length.

Items that are longer will be cutoff at the fixed length.

You can choose any value from 0 to 255.

CHAR is faster for fixed length text.
Ex. State abbreviations, yes/no flags, Sex.

### VARCHAR

Pretty much the same as CHAR except it stores strings at variable lengths.

It will also cutoff text that is longer than the specified length, but will
not pad the string if it is shorter than the length.

You can choose any value from 0 to 65535.

## Numeric

### INT

Stores whole numbers.

Number can be from -2147483648 to 2147483647

### DECIMAL

Are fixed-point types and have EXACT calculations.

Stores decimals. Takes 2 params

1st param - The amount of total digits. Can be 1 to 65.
2nd param - The amount of digits to the right of the decimal. Can be 0 to 30.

// 5 digits, 2 decimal places.
`DECIMAL(5, 2)` => 123.45

If the number inserted is larger than the max specified the numbers will fill up to the max possible.
123432434234 => 999.99 // Using the above example

### FLOAT && DOUBLE

Are floating-point types and have APPROXIMATE calculations.

Stores larger numbers with less data.

Less accurate but a lot faster!

## Dates/Times

### DATE

Values with a Date but no time.

Stored as `YYYY-MM-DD`.

### TIME

Values with a time and not date.

Stored as `HH:MM:SS`

### DATETIME

Can store values with a Date and a Time. (Wow!)

Stored as `YYYY-MM-DD HH:MM:SS`

## Helpful DATE && TIME methods

### CURDATE && CURTIME && NOW

These methods return the current date && times depending on which ones you use.

### DAY

Returns the day of the month.

### DAYNAME

Returns the name of the day of the week.

### DAYOFWEEK

Returns the number of the day of the week. Starts at 1.

### DAYOFYEAR

Returns what day it is out of the year.

### MONTH

Returns the number of the month.

### MONTHNAME

returns the name of the month.

### HOUR && MINUTE && SECOND

Returns parts of the time.

### DATEFORMAT

Can format dates to be more readable or another desired format.

[See Here](https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html#function_date-format)

### DATE MATH

#### DATEDIFF

Returns the value in days from one date to the other.

##### DATE_ADD

Adds time (month, year, days) to a date.

You can also just use `+/-` signs.

[See Hear](https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html#function_date-add)

#### TIMESTAMPS

Does relatively the same thing as DATETIME, but the range of times and dates varies.

TIMESTAMP ranges from 1970 to 2038. DATETIME can rage to year 1000 to 9999.

Used to normally track created_at and updated_at for items. It's easier and takes up less storage.

## Logical Operators

Used to further specify results. When you want something that's greater than another.
Or select everything that is exactly like this thing, etc.

- Not Equal - `!=`
- Not Like - `NOT LIKE`
- Greater Than - `>`
- Less Than - `<`
- Logical AND - `AND`
- Logical OR - `OR`
- Between - `BETWEEN <value> AND <value>`
- In And Not In - `<value> IN (<param1>, <param2>, <param3>)` and `<value> NOT IN (<paramN>)`
- Case Statements:
  `CASE WHEN <logic> THEN '*' WHEN <logic1> THEN '**' ELSE '***`
  END AS <readable_name>
  `

# Relations

## One to One

Not very common.
Add additional table for use details.
One detail entry for one customer.

## One to Many

The most common relationship.
One book can have tons of reviews.

## Many to Many

The middle, more common than one:one, but less common than one:many.
A book can have many authors, and authors can have many books.
Blog posts and tags.
Students and classes.

# How to work with relationed tables

## Foreign Keys

References to another table within a table.

Use the keyword `FOREIGN KEY` when creating a new table to add a foreign key. You must then pass the name of the column that will be used as the key to `FOREIGN KEY`.

Afterwards you will need to specify the table and column that the foreign key will reference. Ex. `REFERENCES <table_name>(<column_name>);`

Full Example.

```
    CREATE TABLE customers (
        id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
        name VARCHAR(100),
        email VARCHAR(100)
    );

    CREATE TABLE orders (
        id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
        order_date DATE,
        amount DECIMAL(8,2),
        customer_id INT,
        FOREIGN KEY(customer_id) REFERENCES customers(id)
    );
```

## Cross Join

Instead of coding something like:

`SELECT * FORM customers WHERE last_name = 'George';` and
`SELECT * FROM orders WHERE customer_id = 1;`

We can use a sub-query like this.

`SELECT * FORM orders WHERE ( SELECT id FROM customers WHERE last_name = 'George' ); `

The above is also not ideal. It's basically the same as the first, and isn't easily
used dynamically.

With JOINS we can save a lot of time making queries.

Ex.

`SELECT * FROM customers, orders;`

This will basically multiply the two tables together, by showing each possible combination.
It doesn't mean much to us, and can be pretty hard to understand.

## Inner Join

Most common joining method. Returns all results that fit the criteria. (Leaves out results that do not relate to each other.)

#### Implicit Inner Join

**Joining tables where they match.**

Similar to Cross joining tables, we can narrow down the information to something that can make sense to us.

`SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;`

You can specify which table column your using. Like both the orders, and customers tables have an id. So
above we specify the customers.id and orders.customer_id. This narrows our results so that we're not getting
a ton of confusing information.

### Explicit Inner Joins

**Joining tables where they don't match.**

The following example does the same thing as the implicit join. Except the syntax is... well more explicit.

Ex.
`SELECT * FROM customers JOIN orders ON customers.id = orders.customer_id;`

## Left Join

Select everything from table A, along with any matching records from table B.

`SELECT * FROM customers LEFT JOIN orders ON customers.id = orders.customer_id;`

Will return all customers, even those that DO NOT have orders.

## Right Join

Select everything from table B, along with any matching records from table A.

`SELECT * FROM customer RIGHT JOIN orders ON customers.id = orders.customer_id;`

## Many to Many connectors

Connect two table in many:many relationship by introducing a third table that has a one:one relationship with each.

Series Data <-> Reviews Data <-> Reviewers Data
