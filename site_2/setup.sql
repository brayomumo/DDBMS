USE site2_database;

CREATE TABLE employee(
    --  department="marketing" or department="support"
    id INT PRIMARY KEY NOT NULL,
    name varchar(250)  NOT NULL,
    email VARCHAR(40)  NOT NULL,
    date_of_birth date  NOT NULL,
    phone_number INT  NOT NULL, 
    department varchar(20)  NOT NULL
);


CREATE TABLE customer(
    id INT  PRIMARY KEY NOT NULL,
    name varchar(250)  NOT NULL,
    email VARCHAR(40)  NOT NULL,
    date_added date  NOT NULL,
    phone_number INT  NOT NULL, 
    address varchar(20)  NOT NULL
);



CREATE TABLE supplier(
    id INT  PRIMARY KEY NOT NULL,
    name varchar(250)  NOT NULL,
    email VARCHAR(40)  NOT NULL,
    date_added date  NOT NULL,
    phone_number INT  NOT NULL, 
    address varchar(20)  NOT NULL
);

CREATE TABLE request(
    id INT  PRIMARY KEY NOT NULL,
    customer_id INT  NOT NULL,
    date_delivered date   NOT NULL,
    date_paid date  NOT NULL,
    amount INT  NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

INSERT INTO request(id,customer_id,date_delivered,date_paid,amount)
VALUES
(2001, 1, '2022-3-10', '2022-3-15', 1000000),
(2002, 2, '2022-2-10', '2022-2-15', 100000),
(2003, 1, '2022-1-10', '2022-1-15', 1000000),
(2004, 3, '2022-4-10', '2022-4-15', 100000),
(2005, 2, '2022-3-10', '2022-3-15', 1000000),
(2006, 4, '2022-3-15', '2022-3-17', 10000),
(2007, 4, '2022-3-20', '2022-3-25', 1000000);


INSERT INTO employee (id,name, email, date_of_birth, phone_number, department) 
VALUES 
(106,'june', 'june@gmail.com', '1995-06-01', 74567890, 'marketing') ,
(107,'dolly', 'dolly@gmail.com', '1995-06-01', 74567890, 'support'), 
(108,'ann', 'ann@gmail.com', '1995-06-01', 74567890, 'marketing') ,
(109,'ahmed', 'ahmed@gmail.com', '1995-06-01', 74567890, 'support') ,
(110,'daniel', 'daniel@gmail.com', '1995-06-01', 74567890, 'marketing') ;

INSERT INTO customer(id, name, email, date_added, phone_number, address)
VALUES
(1, 'custm 1', 'custm1@gmail.com', '2021-06-20', 7228223321, 'addr1'),
(2, 'custm 2', 'custm2@gmail.com', '2021-06-20', 7228223322, 'addr2'),
(3, 'custm 3', 'custm3@gmail.com', '2021-06-20', 7228223323, 'addr3'),
(4, 'custm 4', 'custm4@gmail.com', '2021-06-20', 7228223324, 'addr4');


INSERT INTO supplier(id, name, email, date_added, phone_number, address)
VALUES
(10, 'supplier 1', 'supplier-1@gmail.com', '2021-06-20', 7228223321, 'addr1'),
(20, 'supplier 2', 'supplier-2@gmail.com', '2021-06-20', 7228223322, 'addr2'),
(30, 'supplier 3', 'supplier-3@gmail.com', '2021-06-20', 7228223323, 'addr3'),
(40, 'supplier 4', 'supplier-4@gmail.com', '2021-06-20', 7228223324, 'addr4');



GO
--  /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "mssql1Ipw"
-- SELECT name FROM sys.databases;
-- SELECT   * FROM  INFORMATION_SCHEMA.TABLES;