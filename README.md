# Bursary Management System Database

This database is part of a Bursary Management System that allows institutions to manage allocated funds and process funding requests for students.

## Overview

The Bursary Management System is designed to streamline the allocation of funds and facilitate the funding request process. Institutions can request funding for students, and these requests are sent to the funder for approval or decline. The funder will manage the institutions and allocations on they system.
![image](https://github.com/Keith-Hughes/BursaryDatabase/assets/62145841/f004bc3f-b4a6-4580-980c-5cf74509d165)


## Table of Contents

1. [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Database Initialization](#database-initialization)
2. [Usage](#usage)
    - [Interacting with the Database](#interacting-with-the-database)
    - [Executing Procedures](#executing-procedures)
    - [System Workflow](#system-workflow)


## Getting Started

### Prerequisites

- SQL Server Management Studio (SSMS) [Download SSMS](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16)
- Microsoft SQL Server or Azure SQL Server.
- Clone of this repo on your machine. ```git git clone https://github.com/Keith-Hughes/BursaryDatabase```
### Installation

- Open SQL Server Management Studio:
Launch SQL Server Management Studio on your computer.

- Connect to a Server:
Connect to the SQL Server instance where you want to run the script. Enter the server name, authentication details, and click "Connect."

- Open a Query Window:
In the Object Explorer, navigate to the database or connect to the server where you want to run the script.
Right-click on the database or server, choose "New Query."

- Load or Paste the Script to create the Database:
Locate the create_database.sql file in the root of the repo, you can open it using the "File" menu (File > Open > File).
If you have the script in your clipboard or want to write a new script, paste it into the query window.
Run the Script:

Click the "Execute" button (or press F5).
Alternatively, you can select the script you want to run and press F5.

### Database Initialization

To initialize the database and populate constant data, follow these steps:

1. Execute the `create_all_tables.sql` procedure to create all necessary tables.

2. Execute the `create_all_procedures.sql` procedure to populate all procedures.

3. Execute `create_all_views.sql` script to create all the views.

4. Execute `create_all_functions.sql` script to create the all the functions.

5. Execute `create_all_triggers.sql` script to create all the triggers.

6. Execute `populate_constants.sql` script to populate all the constants tables.

## Usage

### Interacting with the Database

- The database is pre-loaded with procedures and functions to facilitate the data regarding bursaries.

### Executing Procedures

The system provides various procedures to perform specific tasks. Execute these procedures to achieve different functionalities:

- CreateStudentRequest: Populates the relavent tables when a new student request is submitted.

#### Parameters:

@FirstName VARCHAR(120), 
@LastName VARCHAR(120), 
@DateOfBirth DATE, 
@Amount MONEY, 
@StatusName VARCHAR(10), 
@InstitutionID INT, 
@InstitutionAdminsID INT,
@BBDAdminID INT = NuLL,
@StatusID INT= 1,
@Movtivation VARBINARY(MAX),
@Race VARCHAR(20)
##### EXAMPLE:
```sql
-- Example execution of the CreateStudentRequest procedure

DECLARE @FirstName VARCHAR(120) = 'John';
DECLARE @LastName VARCHAR(120) = 'Doe';
DECLARE @DateOfBirth DATE = '1990-01-15';
DECLARE @Amount MONEY = 5000.00;
DECLARE @StatusName VARCHAR(10) = 'Pending';
DECLARE @InstitutionID INT = 1;
DECLARE @InstitutionAdminsID INT = 101;
DECLARE @BBDAdminID INT = NULL; -- Optional parameter, set to NULL
DECLARE @StatusID INT = 1; -- Default value if not provided
DECLARE @Motivation VARBINARY(MAX) = 0x546869732069732061206d6f7469766174696f6e2e; -- Example binary data
DECLARE @Race VARCHAR(20) = 'African';

-- Execute the procedure
EXEC CreateStudentRequest 
    @FirstName,
    @LastName,
    @DateOfBirth,
    @Amount,
    @StatusName,
    @InstitutionID,
    @InstitutionAdminsID,
    @BBDAdminID,
    @StatusID,
    @Motivation,
    @Race;
```
#### Procedure Definition
```sql
CREATE PROCEDURE CreateStudentRequest 
@FirstName VARCHAR(120), 
@LastName VARCHAR(120), 
@DateOfBirth DATE, 
@Amount MONEY, 
@StatusName VARCHAR(10), 
@InstitutionID INT, 
@InstitutionAdminsID INT,
@BBDAdminID INT = NuLL,
@StatusID INT= 1,
@Movtivation VARBINARY(MAX),
@Race VARCHAR(20)

AS

BEGIN TRANSACTION InsertStudentRequest;
BEGIN TRY
INSERT INTO Students(
    InstitutionID,
    FirstName,
    LastName,
    DateOfBirth,
    Department,
    RaceID

)
VALUES (
    @InstitutionID,
    @FirstName,
    @LastName,
    @DateOfBirth,
    (SELECT DepartmentName FROM InstutionAdmins
    WHERE InstitutionID=@InstitutionID),
    (SELECT RaceID FROM Races
    WHERE Race=@Race)
);


INSERT INTO StudentRequests(
    StudentID,
    Motivation,
    Amount,
    DateOfRequestSent,
    DateOfStatusUpdate,
    StatusID,
    InstitutionAdminsID,
    InstitutionID
)
VALUES(
    (SELECT StudentID
FROM Students
WHERE StudentID = (SELECT MAX(StudentID) FROM Students)),
    @Motivation,
    @Amount,
    CONVERT(DATE, GETDATE()),
    CONVERT(DATE, GETDATE()),
    @StatusID,
    @InstitutionAdminsID,
    @InstitutionID

);
COMMIT;
END TRY
BEGIN CATCH
ROLLBACK;
END CATCH
```

- AddNewDocument: Saves the document to the database and allocates it to a Student request
#### EXAMPLE:
```sql
-- Example execution of the AddNewDocument procedure

DECLARE @RequestID INT = 123; -- Replace with the actual RequestID
DECLARE @Document VARBINARY(MAX) = 0x546869732069732061206e657720646f63756d656e74; -- Replace with actual binary data
DECLARE @DocumentType VARCHAR(20) = 'CV'; -- Replace with the actual document type

-- Execute the procedure
EXEC AddNewDocument 
    @RequestID,
    @Document,
    @DocumentType;
```
#### Procedure Definition
```sql
CREATE PROCEDURE AddNewDocument 
@RequestID INT,
@Document VARBINARY(MAX),
@DocumentType VARCHAR(20)

AS

INSERT INTO Documents(
    Document,
    UploadDate,
    DocumentTypeID,
    RequestID
)
VALUES(
    @Document,
    CONVERT(DATE, GETDATE()),
    (SELECT DocumentTypeID FROM DocumentTypes WHERE DocumentType=@DocumentType)
)

```
- ...

### System Workflow

- [Describe the workflow of the Bursary Management System, including how institutions request funding and the approval process.]

