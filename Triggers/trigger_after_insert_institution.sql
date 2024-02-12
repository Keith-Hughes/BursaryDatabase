CREATE TRIGGER trg_AfterInsertInstitution
ON dbo.Institutions
AFTER INSERT
AS
BEGIN
    -- Check if there are any new rows
    IF (SELECT COUNT(*) FROM inserted) > 0
    BEGIN
        -- Call the stored procedure for each new row
        DECLARE @InstitutionID INT;

        SELECT @InstitutionID = InstitutionID
        FROM inserted;

        -- Call the stored procedure that will create the unique views for the new institution
        EXEC CreateInstitutionTotalsView @InstitutionID
    END
END;