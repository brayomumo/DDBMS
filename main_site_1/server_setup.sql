CREATE EXTENSION mysql_fdw;
CREATE EXTENSION tds_fdw;

CREATE SERVER mysql_server                                                              
FOREIGN DATA WRAPPER mysql_fdw 
OPTIONS (host 'ddb-site_3-1', port '1433');

CREATE USER MAPPING FOR postgres                                                        
SERVER mysql_server 
OPTIONS (username 'site3', password 'localhost');

CREATE SERVER mssql_server                                                 
FOREIGN DATA WRAPPER tds_fdw 
OPTIONS (servername 'ddb-site_2-1', port '1433', database 'site3_database');

CREATE USER MAPPING FOR postgres 
SERVER mssql_server
OPTIONS (username 'sa', password 'mssql1Ipw');

-- MAIN SITE TABLES
CREATE TABLE employee(
    -- not(department ="driver" or department="security") and not(department="marketing" or department="support")
    id INT PRIMARY KEY NOT NULL,
    name varchar(250)  NOT NULL,
    email VARCHAR(40)  NOT NULL,
    date_of_birth date  NOT NULL,
    phone_number INT  NOT NULL, 
    department varchar(20)  NOT NULL
);

INSERT INTO employee (id,name, email, date_of_birth, phone_number, department) 
VALUES 
(101,'brian', 'brian@gmail.com', '1995-06-01', 74567890, 'executive'), 
(102,'john', 'john@gmail.com', '1995-06-01', 74567890, 'hr'),
(103,'mary', 'mary@gmail.com', '1995-06-01', 74567890, 'hr') ,
(104,'james', 'james@gmail.com', '1995-06-01', 74567890, 'executive') ,
(105,'collins', 'collins@gmail.com', '1995-06-01', 74567890, 'executive') ;

CREATE TABLE hr_accounts(
    id SERIAL PRIMARY KEY NOT NULL,
    employee_id int  NOT NULL,
    job_group varchar(20)  NOT NULL,
    salary INT  NOT NULL, 
    date_paid date   NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

INSERT INTO hr_accounts(employee_id, job_group, salary, date_paid)
VALUES
(102, 'A', 10000, '2022-3-3'),
(101, 'A', 50000, '2022-3-3'),
(105, 'B', 40000, '2022-3-3'),
(104, 'C', 30000, '2022-3-3'),
(103, 'D', 25000, '2022-3-3');


-- SITE 2 TABLES

CREATE FOREIGN TABLE employee_site_2(
    id INT NOT NULL,
    name varchar(250)  NOT NULL,
    email VARCHAR(40)  NOT NULL,
    date_of_birth date  NOT NULL,
    phone_number INT  NOT NULL, 
    department varchar(20)  NOT NULL
) SERVER mssql_server OPTIONS (table_name 'employee');

CREATE FOREIGN TABLE customer(
    id INT  NOT NULL,
    name varchar(250)  NOT NULL,
    email VARCHAR(40)  NOT NULL,
    date_added date  NOT NULL,
    phone_number INT  NOT NULL, 
    address varchar(20)  NOT NULL
) SERVER mssql_server OPTIONS (table_name 'customer');

CREATE FOREIGN TABLE supplier(
    id INT  NOT NULL,
    name varchar(250)  NOT NULL,
    email VARCHAR(40)  NOT NULL,
    date_added date  NOT NULL,
    phone_number INT  NOT NULL, 
    address varchar(20)  NOT NULL
) SERVER mssql_server OPTIONS (table_name 'supplier');

CREATE FOREIGN TABLE request_site_2(
    id INT  NOT NULL,
    customer_id INT  NOT NULL,
    date_delivered date   NOT NULL,
    date_paid date  NOT NULL,
    amount INT  NOT NULL
) SERVER mssql_server OPTIONS (table_name 'request');


-- SITE 3 TABLES
CREATE FOREIGN TABLE employee_site_3(
    id INT NOT NULL,
    name varchar(250)  NOT NULL,
    email VARCHAR(40)  NOT NULL,
    date_of_birth date  NOT NULL,
    phone_number INT  NOT NULL, 
    department varchar(20)  NOT NULL
) SERVER mysql_server OPTIONS (dbname 'site3_database', table_name 'employee');


CREATE FOREIGN TABLE request_site_3(
    id INT  NOT NULL,
    vehicle_id INT  NOT NULL,
    supplier_id INT  NOT NULL,
    driver_id INT  NOT NULL,
    from_addr varchar(255)  NOT NULL, 
    to_addr varchar(255)  NOT NULL, 
    request_description varchar(255)  NOT NULL, 
    request_status varchar(255)  NOT NULL
) SERVER mysql_server OPTIONS (dbname 'site3_database', table_name 'request');

CREATE FOREIGN TABLE vehicle(
    id INT  NOT NULL,
    reg_no varchar(250) NOT NULL,
    model VARCHAR(40)  NOT NULL,
    date_bought date  NOT NULL
) SERVER mysql_server OPTIONS (dbname 'site3_database', table_name 'vehicle') ;

CREATE FOREIGN TABLE garage(
    id INT  NOT NULL,
    name varchar(250)   NOT NULL,
    email varchar(250)   NOT NULL,
    addr VARCHAR(40)  NOT NULL,
    phone_number VARCHAR(40)  NOT NULL
)  SERVER mysql_server OPTIONS (dbname 'site3_database', table_name 'garage') ;

CREATE FOREIGN TABLE vehicle_service(
    id INT NOT NULL,
    garage_id INT  NOT NULL,
    amount INT  NOT NULL,
    date_serviced date   NOT NULL,
    service_description varchar(250)   NOT NULL,
    vehicle_id INT  NOT  NULL
)  SERVER mysql_server OPTIONS (dbname 'site3_database', table_name 'vehicle_service') ;