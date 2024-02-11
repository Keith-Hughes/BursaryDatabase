
INSERT INTO Roles(RoleName) 
    VALUES
    ('BBDAdmin'),
    ('InstitutionAdmin');
GO

INSERT INTO DocumentTypes(DocumentType) 
    VALUES
    ('Identity Document'),
    ('Transcript')
    ('CV'),
    ('Other');
GO

INSERT INTO [Races] 
    VALUES 
    ('White'),
    ('Black'),
    ('Coloured'),
    ('Indian'),
    ('Asian'),
    ('Other');
GO

INSERT INTO dbo.[Statuses] 
    VALUES 
    ('Pending'),
    ('Approved'),
    ('Rejected');

GO