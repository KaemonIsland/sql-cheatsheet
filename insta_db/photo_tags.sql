CREATE TABLE photo_tags (
  tag_id INT NOT NULL,
  photo_id INT NOT NULL,

  FOREIGN KEY(tag_id) REFERENCES tags(id),
  FOREIGN KEY(photo_id) REFERENCES photos(id),
  PRIMARY KEY(tag_id, photo_id)
);