USE BursaryDB
GO

CREATE PROCEDURE CreateRacesTable
AS
BEGIN
    CREATE TABLE Races (
       RaceID INT IDENTITY(1,1) NOT NULL,
       Race VARCHAR(20) NOT NULL,	
       CONSTRAINT PK_Races PRIMARY KEY (RaceID),
    );
END;

EXEC dbo.CreateRacesTable