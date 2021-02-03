CREATE TABLE photos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  image_url VARCHAR(200),
  user_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(id)
);

-- Update a table with alter

ALTER TABLE photos
ADD COLUMN caption VARCHAR(255);