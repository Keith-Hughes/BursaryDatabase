
INSERT INTO StudentRequests (
    RequestID,
    StudentID,
    Motivation,
    Amount,
    StatusID,
    DateOfRequestSent,
    DateOfStatusUpdate,
    InstitutionAdminsID,
    InstitutionID,
    BBDAdminID
) VALUES
    (1,  1,  0x01,  1000.00, 1, '2024-02-09', '2024-02-09',  1,  1,  1),
    (2,  2,  0x02,  2000.00, 2, '2024-02-08', '2024-02-09',  2,  2,  2),
    (10,  10,  0x0A,  3000.00, 1, '2024-02-07', '2024-02-09',  10,  10,  10);
