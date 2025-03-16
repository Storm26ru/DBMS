--SQLQuery4 - GetDisciplineName
USE VPD_311_Import;
GO

ALTER FUNCTION GetDisciplineName (@discipline_id SMALLINT) RETURNS NVARCHAR(150)
BEGIN
	RETURN(SELECT discipline_name FROM Disciplines WHERE discipline_id = @discipline_id);
END