--USERTABLE--
create table userr(email_id varchar(100) primary key, 
contact int,gender varchar(1),
username varchar(50),
dob int, 
fname varchar(50), 
mname varchar(50),l
name varchar(50) );
select * from userr;
ALTER TABLE userr ADD COLUMN t_id varchar(15);
alter table userr drop column t_id;
ALTER TABLE userr ADD CONSTRAINT fk_t_id FOREIGN KEY (t_id) REFERENCES Transaction_t(trans_id);
--ALTER TABLE userr ADD CONSTRAINT unique_username UNIQUE (username);


--Transcation table--
Create table Transaction_t(trans_id varchar(15)primary key ,amount int,time_of_transaction int );
select * from Transaction_t;
ALTER TABLE Transaction_t ADD COLUMN user_id VARCHAR(50);
ALTER TABLE Transaction_t ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES userr(username);

--Ticket Table--
CREATE TABLE ticket (
    Ticket_no INT PRIMARY KEY,
    date INT,
    time INT,
    airport VARCHAR(50),
    seat_no VARCHAR(5),
    trans_id VARCHAR(15),
    Flight_id VARCHAR(10),
    user_id VARCHAR(50),
    FOREIGN KEY (trans_id) REFERENCES Transaction_t(trans_id),
    FOREIGN KEY (Flight_id) REFERENCES Flight(Flight_id),
    FOREIGN KEY (user_id) REFERENCES userr(email_id)
);

SELECT * FROM ticket;



--flight Table--
create table flight( Flight_id varchar(10) primary key, sourcee char(40), destination char(40));
select * from flight;
drop table flight;
ALTER TABLE flight ADD CONSTRAINT uq_flight_id UNIQUE (Flight_id);

--office table--
CREATE TABLE office (
    loc_id INT PRIMARY KEY,
    dept_id INT,
    ssn INT,
    superlocation INT,
    name CHAR(50),
    trans_id VARCHAR(15),
    user_id VARCHAR(100),
    FOREIGN KEY (trans_id) REFERENCES Transaction_t(trans_id),
    FOREIGN KEY (user_id) REFERENCES userr(email_id),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id),
    FOREIGN KEY (ssn) REFERENCES employee(ssn),
    FOREIGN KEY (superlocation) REFERENCES office(Loc_id)
);
select * from office;


--Employee table--
Create table employee(Ssn int primary key); 
fname varchar(20),
lname varchar(20),
d_type varchar(10),
loc_id int ,
dept_id int,
salary int, 
duration_of_work int,
manager_ssn int,
FOREIGN KEY (dept_id) REFERENCES department(dept_id),
FOREIGN KEY (d_type) REFERENCES depttype(d_type),
FOREIGN KEY (loc_id) REFERENCES office(loc_id),
foreign key (manager_ssn) references employee(Ssn));

select * from employee;


--flight table--
CREATE TABLE flight_crew (
    FC_id INT PRIMARY KEY,
    dept_id INT,
	d_type varchar(20),
	ssn int,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id),
	   FOREIGN KEY (d_type) REFERENCES depttype(d_type),
	      FOREIGN KEY (ssn) REFERENCES employee(Ssn)
	   
);
select * from flight_crew;

--security--
CREATE TABLE Securiety (
    S_id INT PRIMARY KEY,
    dept_id INT,
	d_type varchar(20),
	ssn int,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id),
	   FOREIGN KEY (d_type) REFERENCES depttype(d_type),
	      FOREIGN KEY (ssn) REFERENCES employee(Ssn)
	   
);

select * from securiety;

--weather--
CREATE TABLE weather (
    weather_id INT PRIMARY KEY,
    dept_id INT,
	d_type varchar(20),
	ssn int,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id),
	   FOREIGN KEY (d_type) REFERENCES depttype(d_type),
	      FOREIGN KEY (ssn) REFERENCES employee(Ssn)
	   
);
select * from weather;

--maintenance---

CREATE TABLE maintenance (
    m_id INT PRIMARY KEY,
    dept_id INT,
	d_type varchar(20),
	ssn int,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id),
	  -- FOREIGN KEY (d_type) REFERENCES depttype(d_type),--
	      FOREIGN KEY (ssn) REFERENCES employee(Ssn)
	   
);
select * from maintenance;

--Department--
 CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dname VARCHAR(50),
    ssn CHAR(9),
    loc_id INT,
    d_typ VARCHAR(10),
    FOREIGN KEY (loc_id) REFERENCES office(loc_id),
    FOREIGN KEY (d_typ) REFERENCES depttype(d_type)
);
select * from department;


--dtype
CREATE TABLE depttype (
    d_type VARCHAR(10) PRIMARY KEY
);
select * from depttype;
