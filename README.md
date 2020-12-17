# sql-cheatsheet

A cheat sheat for MySQL/SQL usage.

# Databases

## List

`show databases;`

## Create

`CREATE DATABASE <database_name>;`

## Delete

`DROP DATABASE <database_name>;`

## Select/Use

`USE <database_name>;`

Or

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

`CREATE TABLE unique_cats ( cat_id INT NOT NULL AUTO_INCREMENT, // Cannot be null and will auto update the id name VARCHAR(20), age INT, PRIMARY KEY (cat_id) ); `

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

## SELECT

Selects property from table.

Show all items within table

`SELECT * FROM <table_name>`

Show all of one column value within a table

`SELECT <column> FROM <table_name>;`

EX. `SELECT name FROM employees;`

Use a comma to select multiple columns. (order matters)

EX. `SELECT age, name FROM users;`

## INSERT

Inserts data into tables

Order matters with params!

`INSERT INTO <table_name>(column_name1, column_name2) VALUES (column_name1, column_name2);`

Can bulk insert data.

`INSERT INTO <table_name>(column_name1, column_name2) VALUES (column_name1, column_name2), (column_name1, column_name2), (column_name1, column_name2);`

# Warnings

## Show

Run this command if you receive a message when insterting data into a table.
Warnings can only be shown immediately after receiving one. Otherwise it will show 0 warnings.

`SHOW WARNINGS;`
