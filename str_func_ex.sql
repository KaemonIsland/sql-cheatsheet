SELECT
  CONCAT(
    SUBSTR(
      title, 1, 10
    ),
    '...'
  ) AS 'Short Title'
FROM books;