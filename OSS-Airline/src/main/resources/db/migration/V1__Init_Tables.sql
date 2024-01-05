CREATE TABLE user (                                    id VARCHAR(255),                                    username VARCHAR(255),                                    password VARCHAR(255),                                    email VARCHAR(255),                                    PRIMARY KEY (id));CREATE TABLE passenger (                                         id VARCHAR(255),                                         name VARCHAR(255),                                         surname VARCHAR(255),                                         mail VARCHAR(255),                                         PIN VARCHAR(255),                                         DOB DATE,                                         PRIMARY KEY (id));CREATE TABLE airplane (                                        id VARCHAR(255),                                        registration VARCHAR(255),                                        model VARCHAR(255),                                        first_seats INT,                                        business_seats INT,                                        economy_seats INT,                                        PRIMARY KEY (id));CREATE TABLE airport (                                       id VARCHAR(255),                                       name VARCHAR(255),                                       IATA CHAR(3),                                       PRIMARY KEY (id));CREATE TABLE flight (                                      id VARCHAR(255),                                      flight_number VARCHAR(255),                                      from_id VARCHAR(255),                                      to_id VARCHAR(255),                                      airplane_id VARCHAR(255),                                      date DATE,                                      time TIME,                                      gate VARCHAR(255),                                      duration TIME,                                      PRIMARY KEY (id),                                      FOREIGN KEY (from_id) REFERENCES airport (id),                                      FOREIGN KEY (to_id) REFERENCES airport (id),                                      FOREIGN KEY (airplane_id) REFERENCES airplane (id));CREATE TABLE seat (                                    id VARCHAR(255),                                    flight_id VARCHAR(255),                                    seat_price DECIMAL(10, 2),                                    seat_class VARCHAR(30),                                    seat_number VARCHAR(30),                                    PRIMARY KEY (id),                                    FOREIGN KEY (flight_id) REFERENCES flight (id));CREATE TABLE purchase (                          id VARCHAR(255) PRIMARY KEY,                          user_id VARCHAR(255),                          payment_info VARCHAR(255),                          payment_date DATE,                          FOREIGN KEY (user_id) REFERENCES user (id));CREATE TABLE ticket (                        id VARCHAR(255) PRIMARY KEY,                        passenger_id VARCHAR(255),                        flight_id VARCHAR(255),                        seat_id VARCHAR(255),                        ticket_price DECIMAL(10, 2),                        purchase_id VARCHAR(255),                        FOREIGN KEY (passenger_id) REFERENCES passenger (id),                        FOREIGN KEY (flight_id) REFERENCES flight (id),                        FOREIGN KEY (seat_id) REFERENCES seat (id),                        FOREIGN KEY (purchase_id) REFERENCES purchase(id));