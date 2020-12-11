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

`CREATE TABLE <table_name> (
  <column_name> <data_type>,
  <column_name> <data_type>
);`

## Show

`SHOW TABLES;`

# Columns

## Show

`SHOW COLUMNS FROM <table_name>;`

Or

`DESC <table_name>;`
