CREATE TABLE User (
    id UUID,
    username VARCHAR(255),
    password VARCHAR(255),
    email VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE Purchase (
    id UUID,
    user_id UUID,
    ticket_id UUID,
    payment_info VARCHAR(255),
    payment_date DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (ticket_id) REFERENCES Ticket(id)
);

CREATE TABLE Passenger (
    id UUID,
    name VARCHAR(255),
    surname VARCHAR(255),
    mail VARCHAR(255),
    PIN VARCHAR(255),
    DOB DATE,
    PRIMARY KEY (id)
);

CREATE TABLE Airplane (
    id UUID,
    registration VARCHAR(255),
    model VARCHAR(255),
    first_seats INT,
    business_seats INT,
    economy_seats INT,
    PRIMARY KEY (id)
);

CREATE TABLE Airport (
    id UUID,
    airport_name VARCHAR(255),
    IATA CHAR(3),
    PRIMARY KEY (id)
);

CREATE TABLE Flight (
    id UUID,
    flight_number VARCHAR(255),
    from_id UUID,
    to_id UUID,
    airplane_id UUID,
    date DATE,
    time TIME,
    gate VARCHAR(255),
    duration TIME,
    PRIMARY KEY (id),
    FOREIGN KEY (from_id) REFERENCES Airport(id),
    FOREIGN KEY (to_id) REFERENCES Airport(id),
    FOREIGN KEY (airplane_id) REFERENCES Airplane(id)
);

CREATE TABLE Seat (
    id UUID,
    flight_id UUID,
    seat_price DECIMAL(10, 2),
    seat_class ENUM('first', 'business', 'economy'),
    PRIMARY KEY (id),
    FOREIGN KEY (flight_id) REFERENCES Flight(id),
);
¸
CREATE TABLE Ticket (
    id UUID,
    passenger_id UUID,
    flight_id UUID,
    seat_id UUID,
    ticket_price DECIMAL(10, 2),
    PRIMARY KEY (id),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(id),
    FOREIGN KEY (flight_id) REFERENCES Flight(id),
    FOREIGN KEY (seat_id) REFERENCES Seat(id)
);

