CREATE TABLE booking (
  listing_id INT NOT NULL,
  guest_username VARCHAR(60) NOT NULL,
  date_from DATE NOT NULL,
  date_to DATE NOT NULL,
  FOREIGN KEY (listing_id) REFERENCES listings(id),
  FOREIGN KEY (guest_username) REFERENCES users(username)
);
