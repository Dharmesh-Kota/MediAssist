CREATE DATABASE MediAssist;

-- Session Table
CREATE TABLE Session (
    sid VARCHAR(255) NOT NULL,
    sess json NOT NULL,
    expire TIMESTAMP(6) NOT NULL,
    PRIMARY KEY (sid)
);

-- UserS Table
CREATE TABLE Users (
    id VARCHAR(255),
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- Patient Table
CREATE TABLE Patient (
    id CHAR(12),
    email VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    gender CHAR(1),
    height FLOAT,
    weight FLOAT,
    blood_group VARCHAR(3),
    diseases VARCHAR(255),
    past_history VARCHAR(1023),
    address VARCHAR(255),
    contact VARCHAR(255),
    PRIMARY KEY (id)
);

-- Hospital Table
CREATE TABLE Hospital(
	EMAIL VARCHAR(255),
	USERNAME VARCHAR(255),
	NAME VARCHAR(255),
	LOCATION VARCHAR(1023),
	ADDRESS VARCHAR(1023),
	TOTAL_DOCTORS INT,
	SPECIALITIES VARCHAR(1023),
	INSURANCE_POLICIES VARCHAR(1023),
	CASHLESS VARCHAR(3),
	ICU INT,
	IICU INT,
	OPERATION_THEATRES INT,
	GENERAL_WARD INT,
	NURSE INT,
	INTERNS INT,
	OT_TECHNICIANS INT,
	PRIMARY KEY(EMAIL)
);

-- Hospital Contact Table
CREATE TABLE Hospital_Contact(
    INDEX INTEGER,
	EMAIL VARCHAR(255),
	CONTACT VARCHAR(20),
	PRIMARY KEY (EMAIL, CONTACT)
);

--Ambulance_driver
CREATE TABLE Ambulance_driver(
    email VARCHAR(255) PRIMARY KEY,
    contact_number  CHAR(10), 
    licence  CHAR(16) NOT NULL,
    vehicle_number VARCHAR(16) NOT NULL,
);
--Laboratory table
CREATE TABLE Laboratory(
 email VARCHAR(255) ,
 lab_name VARCHAR(255) NOT NULL,
 contact_number CHAR(10) ,
 instruments VARCHAR(255),
 email_hospital VARCHAR(255) NOT NULL,
 FOREIGN KEY (email_hospital) REFERENCES Hospital(email)
 PRIMARY KEY(email)
);
-- appointment table
CREATE TABLE appointment (
    appointment_id CHAR(20),
    patient_id CHAR(12) NOT NULL,
    doctor_reg_number VARCHAR(12) NOT NULL,
    slot INT NOT NULL,
    date VARCHAR(10) NOT NULL,
    PRIMARY KEY(appointment_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(id),
    FOREIGN KEY (doctor_reg_number) REFERENCES Doctor(doctor_reg_number)
);

-- Medicine Table
CREATE TABLE Medicine(
    medicine_name VARCHAR(255),
    brand_name VARCHAR(255),
    PRIMARY KEY(medicine_name, brand_name)
);

-- Pharmacy Table
CREATE TABLE Pharmacy(
    email VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    contact CHAR(10),
    email_hospital CHAR(255),
    PRIMARY KEY(email),
    FOREIGN KEY(email_hospital) REFERENCES Hospital(EMAIL)
);

-- Works Table
CREATE TABLE works(
    doc_reg_no VARCHAR(12),
    email VARCHAR(12),
    start_time TIME,
    end_time TIME,
    salary DECIMAL(9,2),
    PRIMARY KEY(doc_reg_no,email),
    FOREIGN KEY(doc_reg_no) REFERENCES Doctor(reg_no),
    FOREIGN KEY(email) REFERENCES Hospital(EMAIL)
);

--Stores
CREATE TABLE Stores(
    email_pharm VARCHAR(255),
    medicine_name VARCHAR(255),
    brand_name VARCHAR(255),
    stock INT,
    PRIMARY KEY(email_pharm,medicine_name,brand_name),
    FOREIGN KEY(email_pharm) REFERENCES Pharmacy(email),
    FOREIGN KEY(medicine_name,brand_name) REFERENCES Medicine
);

--Access
CREATE TABLE Access(
    email_hospital VARCHAR(255),
    email_driver VARCHAR(255),
    PRIMARY KEY (email_hospital,email_driver),
    FOREIGN KEY(email_hospital) REFERENCES Hospital(EMAIL),
    FOREIGN KEY(email_driver) REFERENCES Ambulance_driver(email) 
);

-- Gov_Agency
CREATE TABLE Gov_Agency(
    email VARCHAR(255) NOT NULL,
    agency_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (email,agency_id)
);