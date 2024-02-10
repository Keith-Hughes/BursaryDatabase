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
GO;