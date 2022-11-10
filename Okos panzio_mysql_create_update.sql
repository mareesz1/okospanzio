CREATE TABLE `Guests` (
	`id` int(128) NOT NULL AUTO_INCREMENT,
	`first_name` varchar(128) NOT NULL,
	`last_name` varchar(128) NOT NULL,
	`email` varchar(128) NOT NULL,
	`phone` varchar(128) NOT NULL,
	`address` varchar(128) NOT NULL,
	`QR` json(128) NOT NULL AUTO_INCREMENT UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `menu` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`price` double(255) NOT NULL,
	`food_type` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `restaurant` (
	`tables` int NOT NULL,
	PRIMARY KEY (`tables`)
);

CREATE TABLE `room` (
	`number` int NOT NULL,
	`type_id` int(255) NOT NULL,
	`bed` int NOT NULL,
	`extra_price` double NOT NULL,
	`description` varchar(255) NOT NULL,
	`NFC_key` int(255) NOT NULL,
	PRIMARY KEY (`number`)
);

CREATE TABLE `reservation` (
	`room_number` int NOT NULL UNIQUE,
	`Guest_id` int NOT NULL UNIQUE,
	`start` DATETIME NOT NULL,
	`end` DATETIME NOT NULL
);

CREATE TABLE `order` (
	`table` int NOT NULL UNIQUE,
	`food_id` int NOT NULL UNIQUE,
	`guest_id` int NOT NULL UNIQUE,
	`sum_price` double NOT NULL
);

CREATE TABLE `room_types` (
	`type` int NOT NULL AUTO_INCREMENT,
	`room_price` double NOT NULL,
	PRIMARY KEY (`type`)
);

CREATE TABLE `NFC` (
	`chip_id` int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`chip_id`)
);

CREATE TABLE `services` (
	`service type` int NOT NULL AUTO_INCREMENT,
	`description` varchar(255) NOT NULL,
	`price` double(255) NOT NULL,
	PRIMARY KEY (`service type`)
);

CREATE TABLE `used_services` (
	`service_id` bigint NOT NULL,
	`time_start` DATETIME NOT NULL,
	`time_end` DATETIME NOT NULL,
	`calculated_price` int NOT NULL
);

CREATE TABLE `Bill` (
	`services` int NOT NULL,
	`room_price` int NOT NULL
);

ALTER TABLE `room` ADD CONSTRAINT `room_fk0` FOREIGN KEY (`type_id`) REFERENCES `room_types`(`type`);

ALTER TABLE `room` ADD CONSTRAINT `room_fk1` FOREIGN KEY (`NFC_key`) REFERENCES `NFC`(`chip_id`);

ALTER TABLE `reservation` ADD CONSTRAINT `reservation_fk0` FOREIGN KEY (`room_number`) REFERENCES `room`(`number`);

ALTER TABLE `reservation` ADD CONSTRAINT `reservation_fk1` FOREIGN KEY (`Guest_id`) REFERENCES `Guests`(`id`);

ALTER TABLE `order` ADD CONSTRAINT `order_fk0` FOREIGN KEY (`table`) REFERENCES `restaurant`(`tables`);

ALTER TABLE `order` ADD CONSTRAINT `order_fk1` FOREIGN KEY (`food_id`) REFERENCES `menu`(`food_type`);

ALTER TABLE `order` ADD CONSTRAINT `order_fk2` FOREIGN KEY (`guest_id`) REFERENCES `Guests`(`id`);

ALTER TABLE `used_services` ADD CONSTRAINT `used_services_fk0` FOREIGN KEY (`service_id`) REFERENCES `services`(`service type`);

ALTER TABLE `Bill` ADD CONSTRAINT `Bill_fk0` FOREIGN KEY (`services`) REFERENCES `used_services`(`calculated_price`);

ALTER TABLE `Bill` ADD CONSTRAINT `Bill_fk1` FOREIGN KEY (`room_price`) REFERENCES `room_types`(`room_price`);












