--SQLQuery3 - GetTeacherFirstName
USE VPD_311_Import;
GO

ALTER FUNCTION GetTeacherFirstName(@group INT,@date DATE,@discipline_id SMALLINT) RETURNS NVARCHAR(50)
BEGIN
	RETURN (SELECT first_name FROM Schedule,Teachers WHERE [group]=@group AND [date]=@date AND teacher_id=teacher AND discipline = @discipline_id GROUP BY first_name );
END