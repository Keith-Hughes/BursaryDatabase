IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'BursaryDB')
BEGIN
    CREATE DATABASE BursaryDB;
    PRINT 'BursaryDB created successfully.';
END
ELSE
BEGIN
    PRINT 'BursaryDB already exists.';
END;