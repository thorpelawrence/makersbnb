CREATE TABLE listings
(
    PRIMARY KEY,
    property_name VARCHAR(60) ,
    home_type VARCHAR(60),
    area VARCHAR(40),
    no_beds INT,
    room_type VARCHAR(40),
    max_people INT,
    price MONEY,
    date_from DATE,
    date_to DATE,
    wifi BIT DEFAULT 0,
    parking BIT DEFAULT 0,
    kitchen BIT DEFAULT 0,
    heating BIT DEFAULT 0,
    image_link VARCHAR
);