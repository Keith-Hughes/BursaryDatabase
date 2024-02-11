
/*This view shows all the relavent information about the students*/
CREATE VIEW vw_Get_ALL_students_Applications 
AS

SELECT  studs.FirstName, studs.LastName,ra.RaceName, 
		instu.InstitutionName, qua.Deapartname,
		qua.QualificationName,stu.StatusName,req.Amount,qua.AverageMark
		AS CurrentAverageMark,req.Motivation
FROM Institutions instu, Students studs, Races ra,Statuses stu,StudentRequests req, Qualification qua
WHERE
studs.InstitutionID = instu.InstitutionID AND
studs.RaceID = ra.RaceID AND
studs.StudentID = req.StudentID AND
req.StatusID = stu.StatusID AND
qua.StudentID = studs.StudentID
GO


CREATE VIEW vw_rejected_students_details
AS
	SELECT * FROM vw_Get_ALL_students_Applications
	WHERE StatusName = 'Rejected'
GO


CREATE VIEW vw_pending_students_details
AS
	SELECT * FROM vw_Get_ALL_students_Applications
	WHERE StatusName = 'Pending'
GO

-- View from a view, gets All students that [Accepted]
CREATE VIEW vw_accepted_students_details
AS
	SELECT * FROM vw_Get_ALL_students_Applications
	WHERE StatusName = 'Accepted'