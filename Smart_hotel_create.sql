use smart_hotel;
-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-07 08:32:46.659

-- tables
-- Table: guests
CREATE TABLE guests (
    id int NOT NULL,
    first_name varchar(128) NOT NULL,
    last_name varchar(128) NOT NULL,
    email varchar(255) NOT NULL,
    phone varchar(128) NULL,
    address varchar(255) NULL,
    balance int NOT NULL,
    room_reservation_id int NOT NULL,
    CONSTRAINT guests_pk PRIMARY KEY (id)
);

-- Table: menu
CREATE TABLE menu (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    price int NOT NULL,
    food_type varchar(255) NOT NULL,
    tables_id int NOT NULL,
    CONSTRAINT menu_pk PRIMARY KEY (id)
);

-- Table: reservation
CREATE TABLE reservation (
    id int NOT NULL,
    guest_id int NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    discount_percent decimal(3,2) NULL,
    total_price decimal(10,3) NOT NULL,
    details text NULL,
    room_reservation_id int NOT NULL,
    guests_id int NOT NULL,
    tables_id int NOT NULL,
    services_id int NOT NULL,
    CONSTRAINT reservation_pk PRIMARY KEY (id)
);

-- Table: room
CREATE TABLE room (
    id int NOT NULL,
    room_name varchar(255) NOT NULL,
    description text NOT NULL,
    type_id int NOT NULL,
    price int NOT NULL,
    room_type_id int NOT NULL,
    CONSTRAINT room_pk PRIMARY KEY (id)
);

-- Table: room_reservation
CREATE TABLE room_reservation (
    id int NOT NULL,
    reservation_id int NOT NULL,
    room_id int NOT NULL,
    price decimal(10,2) NOT NULL,
    room_2_id int NOT NULL,
    CONSTRAINT room_reservation_pk PRIMARY KEY (id)
);

-- Table: room_type
CREATE TABLE room_type (
    id int NOT NULL,
    name varchar(100) NOT NULL,
    floor int NOT NULL,
    CONSTRAINT room_type_pk PRIMARY KEY (id)
);

-- Table: services
CREATE TABLE services (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    membership bool NOT NULL,
    CONSTRAINT services_pk PRIMARY KEY (id)
);

-- Table: tables
CREATE TABLE tables (
    id int NOT NULL,
    places int NOT NULL,
    CONSTRAINT tables_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: guests_room_reservation (table: guests)
ALTER TABLE guests ADD CONSTRAINT guests_room_reservation FOREIGN KEY guests_room_reservation (room_reservation_id)
    REFERENCES room_reservation (id);

-- Reference: menu_tables (table: menu)
ALTER TABLE menu ADD CONSTRAINT menu_tables FOREIGN KEY menu_tables (tables_id)
    REFERENCES tables (id);

-- Reference: reservation_guests (table: reservation)
ALTER TABLE reservation ADD CONSTRAINT reservation_guests FOREIGN KEY reservation_guests (guests_id)
    REFERENCES guests (id);

-- Reference: reservation_room_reservation (table: reservation)
ALTER TABLE reservation ADD CONSTRAINT reservation_room_reservation FOREIGN KEY reservation_room_reservation (room_reservation_id)
    REFERENCES room_reservation (id);

-- Reference: reservation_services (table: reservation)
ALTER TABLE reservation ADD CONSTRAINT reservation_services FOREIGN KEY reservation_services (services_id)
    REFERENCES services (id);

-- Reference: reservation_tables (table: reservation)
ALTER TABLE reservation ADD CONSTRAINT reservation_tables FOREIGN KEY reservation_tables (tables_id)
    REFERENCES tables (id);

-- Reference: room_reservation_room (table: room_reservation)
ALTER TABLE room_reservation ADD CONSTRAINT room_reservation_room FOREIGN KEY room_reservation_room (room_2_id)
    REFERENCES room (id);

-- Reference: room_room_type (table: room)
ALTER TABLE room ADD CONSTRAINT room_room_type FOREIGN KEY room_room_type (room_type_id)
    REFERENCES room_type (id);

-- End of file.

