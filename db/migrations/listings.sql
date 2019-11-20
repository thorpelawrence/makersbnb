CREATE TABLE listings
(

    id SERIAL PRIMARY KEY,
    area VARCHAR(60),
    property_name VARCHAR(60) ,
    home_type VARCHAR(60),
    no_beds INT,
    room_type VARCHAR(40),
    max_people INT,
    price MONEY,
    date_from DATE,
    date_to DATE,
    wifi BOOLEAN DEFAULT FALSE,
    parking BOOLEAN DEFAULT FALSE,
    kitchen BOOLEAN DEFAULT FALSE,
    heating BOOLEAN DEFAULT FALSE,
    username VARCHAR,
    image_link VARCHAR
);