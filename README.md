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