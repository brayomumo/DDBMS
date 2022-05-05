CREATE TABLE IF NOT EXISTS employee(
    -- department ="driver" or department="security"
   id INT PRIMARY KEY NOT NULL,
    name varchar(250)  NOT NULL,
    email VARCHAR(40)  NOT NULL,
    date_of_birth date  NOT NULL,
    phone_number INT  NOT NULL, 
    department varchar(20)  NOT NULL
);



CREATE TABLE IF NOT EXISTS vehicle(
    id INT  PRIMARY KEY NOT NULL,
    reg_no varchar(250)  UNIQUE NOT NULL,
    model VARCHAR(40)  NOT NULL,
    date_bought date  NOT NULL
);


CREATE TABLE IF NOT EXISTS garage(
    id INT  PRIMARY KEY NOT NULL,
    garage_name varchar(250)   NOT NULL,
    email varchar(250)   NOT NULL,
    garage_address VARCHAR(40)  NOT NULL,
    phone_number VARCHAR(250)  NOT NULL
);
CREATE TABLE IF NOT EXISTS vehicle_service(
    id INT PRIMARY KEY NOT NULL,
    garage_id INT  NOT NULL,
    amount INT  NOT NULL,
    date_serviced date   NOT NULL,
    service_description varchar(250)   NOT NULL,
    vehicle_id INT  NOT  NULL,
    FOREIGN KEY(garage_id) REFERENCES garage(id),
    FOREIGN KEY(vehicle_id) REFERENCES vehicle(id)
);
CREATE TABLE IF NOT EXISTS supplier(
    id INT  PRIMARY KEY NOT NULL,
    name varchar(250)  NOT NULL,
    email VARCHAR(40)  NOT NULL,
    phone_number VARCHAR(250)  NOT NULL
);


CREATE TABLE IF NOT EXISTS request(
    id INT  PRIMARY KEY NOT NULL,
    vehicle_id INT  NOT NULL,
    supplier_id INT  NOT NULL,
    driver_id INT  NOT NULL,
    from_addr varchar(255)  NOT NULL, 
    to_addr varchar(255)  NOT NULL, 
    request_description varchar(255)  NOT NULL, 
    request_status varchar(255)  NOT NULL,

    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (driver_id) REFERENCES employee(id)
);

INSERT INTO employee (id,name, email, date_of_birth, phone_number, department) 
VALUES 
(111,'ahmed', 'ahmed@gmail.com', '1995-06-01', 74567890, 'driver') ,
(112,'abdul', 'abdul@gmail.com', '1995-06-01', 74567890, 'security') ,
(113,'mwangi', 'mwangi@gmail.com', '1995-06-01', 74567890, 'driver') ,
(114,'doe', 'doe@gmail.com', '1995-06-01', 74567890, 'security') ,
(116,'jane', 'jane@gmail.com', '1995-06-01', 74567813, 'driver') ,
(115,'kinuthia', 'kinuthia@gmail.com', '1995-06-01', 74567890, 'security');

INSERT INTO vehicle (id, reg_no, model, date_bought)
VALUES
(1001, 'reg1', 'isuzu', '2008-12-3'),
(1002, 'reg2', 'isuzu', '2008-12-3'),
(1003, 'reg3', 'isuzu', '2008-12-3'),
(1004, 'reg4', 'isuzu', '2008-12-3');


INSERT INTO garage(id, garage_name, email, phone_number, garage_address)
VALUES
(10001, 'garage 1', 'garage-1@gmail.com', 7228223321, 'addr1'),
(10002, 'garage 2', 'garage-2@gmail.com', 7228223322, 'addr2');


INSERT INTO supplier(id, name, email, phone_number)
VALUES
(10, 'supplier 1', 'supplier-1@gmail.com', '72282321'),
(20, 'supplier 2', 'supplier-2@gmail.com', '72282322'),
(30, 'supplier 3', 'supplier-3@gmail.com', '72282323'),
(40, 'supplier 4', 'supplier-4@gmail.com', '72282324');


INSERT INTO vehicle_service(id, garage_id, amount, date_serviced, service_description, vehicle_id)
VALUES
(5001, 10001, 100000, '2022-02-21', 'alot of things done', 1001),
(5002, 10001, 300000, '2021-06-21', 'few things done', 1002),
(5003, 10002, 250000, '2022-01-21', 'alot of things done', 1001),
(5004, 10001, 10000, '2022-03-21', 'some things changed', 1003),
(5005, 10002, 1000, '2022-02-21', 'some things changed', 1004);



INSERT INTO request(id, vehicle_id, supplier_id, driver_id, from_addr, to_addr, request_description, request_status)
VALUES
(2001, 1003, 20, 111, 'place_1', 'place_2', 'heavy stuff', 'delivered'),
(2002, 1001, 20, 113, 'place 10', 'place_3', 'relatively heavy stuff', 'pending'),
(2003, 1003, 30, 113, 'place_1', 'place_2', 'heavy stuff', 'pending'),
(2004, 1001, 30, 111, 'place_001', 'place_002', 'heavy stuff', 'complete'),
(2005, 1003, 40, 116, 'place_1001', 'place_20', 'heavy stuff', 'complete'),
(2006, 1003, 20, 111, 'place_0011', 'place_012', 'heavy stuff', 'complete'),
(2007, 1004, 40, 111, 'place_101', 'place_2001', 'heavy stuff', 'delivered');

-- COPY create_user.sql  /docker-entrypoint-initdb.d/