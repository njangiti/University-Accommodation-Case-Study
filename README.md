# University Accommodation Case Study

This project is a database management system for managing university accommodations. It includes an Entity-Relationship (ER) diagram, database schema, and SQL scripts required to create and manipulate the database.

## Team Members
- Narendhar Jangiti
- Bhavana Tallapally
- Ravali Macheti


## Course Information
- **Course Name**: Database Management Systems
- **University**: Rivier University
- **Professor**: Yili Tseng
- **Date**: December 17, 2022

## Project Overview

The University Accommodation database system is designed to manage various aspects of student accommodations, including student details, advisors, courses, leases, invoices, staff, inspections, apartments, and flats.

### ER Diagram

![ER Diagram](path/to/er_diagram.png)

### Database Schema

Below is the schema for the University Accommodation database, including tables and their relationships.

#### Student Table
```sql
CREATE TABLE Student (
  BannerNumber VARCHAR PRIMARY KEY NOT NULL,
  studentName VARCHAR NOT NULL,
  address VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  birthdate DATE NOT NULL,
  nationality VARCHAR NOT NULL,
  gender TINYINT NOT NULL,
  phoneNumber VARCHAR,
  category VARCHAR,
  specialNeeds BOOLEAN,
  status VARCHAR NOT NULL,
  advisor VARCHAR NOT NULL,
  FOREIGN KEY (advisor) REFERENCES Adviser(adviserID)
);
```

####  Adviser Table

```sql
CREATE TABLE Adviser (
  adviserID VARCHAR PRIMARY KEY NOT NULL,
  fullName VARCHAR NOT NULL,
  department VARCHAR NOT NULL,
  position VARCHAR NOT NULL,
  telephone VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  roomNumber VARCHAR NOT NULL
);
```
####  NextOfKin Table
```sql
CREATE TABLE NextOfKin (
  studentID VARCHAR NOT NULL,
  kinName VARCHAR NOT NULL,
  relationship VARCHAR NOT NULL,
  address VARCHAR NOT NULL,
  phoneNumber VARCHAR NOT NULL,
  PRIMARY KEY (studentID, kinName),
  FOREIGN KEY (studentID) REFERENCES Student(BannerNumber)
);
```
####  Courses Table
```sql
CREATE TABLE Courses (
  CourseNumber VARCHAR PRIMARY KEY NOT NULL,
  courseTitle VARCHAR NOT NULL,
  academicyear VARCHAR NOT NULL,
  roomNumber VARCHAR NOT NULL,
  department VARCHAR NOT NULL
);

```
####  Instructor Table
```sql
CREATE TABLE Instructor (
  instructorID VARCHAR PRIMARY KEY NOT NULL,
  instructorName VARCHAR NOT NULL,
  instructorTelephone VARCHAR NOT NULL,
  instructorEmail VARCHAR NOT NULL
);
```
####  InstructorCourses Table
```sql
CREATE TABLE InstructorCourses (
  instructorID VARCHAR NOT NULL,
  CourseNumber VARCHAR NOT NULL,
  PRIMARY KEY (instructorID, CourseNumber),
  FOREIGN KEY (instructorID) REFERENCES Instructor(instructorID),
  FOREIGN KEY (CourseNumber) REFERENCES Courses(CourseNumber)
);

```
####  StudentCourses Table
```sql
CREATE TABLE StudentCourses (
  CourseNumber VARCHAR NOT NULL,
  studentID VARCHAR NOT NULL,
  PRIMARY KEY (studentID, CourseNumber),
  FOREIGN KEY (studentID) REFERENCES Student(BannerNumber),
  FOREIGN KEY (CourseNumber) REFERENCES Courses(CourseNumber)
);
```
####  Lease Table
```sql
CREATE TABLE Lease (
  leaseID VARCHAR PRIMARY KEY NOT NULL,
  leaseduration INT NOT NULL,
  studentID VARCHAR NOT NULL,
  flat_room_number VARCHAR NOT NULL,
  apartment_room_number VARCHAR NOT NULL,
  dateofEntry DATE,
  dateOfExit DATE,
  FOREIGN KEY (studentID) REFERENCES Student(BannerNumber),
  FOREIGN KEY (flat_room_number) REFERENCES Flats(roomNumber),
  FOREIGN KEY (apartment_room_number) REFERENCES Apartment(apartment_id)
);

```
####  Invoices Table
```sql
CREATE TABLE Invoices (
  InvoiceID VARCHAR PRIMARY KEY NOT NULL,
  leaseNumber VARCHAR NOT NULL,
  semester VARCHAR NOT NULL,
  paymentDue FLOAT NOT NULL,
  studentID VARCHAR NOT NULL,
  payDate DATE NOT NULL,
  FOREIGN KEY (leaseNumber) REFERENCES Lease(leaseID),
  FOREIGN KEY (studentID) REFERENCES Student(BannerNumber)
);

```
####  Staff Table
```sql
CREATE TABLE Staff (
  staffNumber VARCHAR PRIMARY KEY NOT NULL,
  staffEmail VARCHAR NOT NULL,
  staffName VARCHAR NOT NULL,
  staffAddress VARCHAR NOT NULL,
  dateOfBirth DATE NOT NULL,
  gender VARCHAR NOT NULL,
  staffPosition VARCHAR NOT NULL,
  staffLocation VARCHAR NOT NULL
);

```
####  Inspections Table
```sql
CREATE TABLE Inspections (
  staffID VARCHAR NOT NULL,
  apartment_Or_hall_id VARCHAR NOT NULL,
  inspection_date DATE NOT NULL,
  propertyCondition VARCHAR,
  comments VARCHAR NOT NULL,
  PRIMARY KEY (staffID, apartment_Or_hall_id, inspection_date),
  FOREIGN KEY (staffID) REFERENCES Staff(staffNumber),
  FOREIGN KEY (apartment_Or_hall_id) REFERENCES Apartment(apartment_id)
);

```
####  Apartment Table
```sql
CREATE TABLE Apartment (
  apartment_id VARCHAR PRIMARY KEY NOT NULL,
  manager_id VARCHAR NOT NULL,
  address VARCHAR NOT NULL,
  numberOfRooms VARCHAR NOT NULL,
  FOREIGN KEY (manager_id) REFERENCES Staff(staffNumber)
);

```
####  ApartmentRooms Table
```sql
CREATE TABLE ApartmentRooms (
  apartment_id VARCHAR NOT NULL,
  bedroomNo VARCHAR NOT NULL,
  place_number VARCHAR NOT NULL,
  rent_rate FLOAT NOT NULL,
  PRIMARY KEY (apartment_id, bedroomNo),
  FOREIGN KEY (apartment_id) REFERENCES Apartment(apartment_id)
);

```
####  Flats Table
```sql
CREATE TABLE Flats (
  hallName VARCHAR NOT NULL,
  hallID VARCHAR PRIMARY KEY NOT NULL,
  numberOfRooms VARCHAR NOT NULL,
  manager_id VARCHAR NOT NULL,
  FOREIGN KEY (manager_id) REFERENCES Staff(staffNumber)
);

```
####  FlatsRooms Table
```sql
CREATE TABLE FlatsRooms (
  roomNumber VARCHAR NOT NULL,
  placeNumber VARCHAR NOT NULL,
  hall_id VARCHAR NOT NULL,
  rentRate FLOAT NOT NULL,
  PRIMARY KEY (hall_id, roomNumber),
  FOREIGN KEY (hall_id) REFERENCES Flats(hallID)
);

```

### Getting Started
To get started with this project, clone the repository from GitHub and set up the database using the provided SQL scripts.

#### Prerequisites
1) MySQL or any other relational database management system that supports SQL
2) SQL client tool (e.g., MySQL Workbench, pgAdmin, etc.)


#### Installation
 Clone the repository:  git clone https://github.com/yourusername/university-accommodation.git
#### bash
 Copy code  
cd university-accommodation

#### License
This project is licensed under the MIT License - see the LICENSE file for details.

#### Acknowledgements
Professor Yili Tseng for guidance and support
Rivier University for providing the resources and platform
