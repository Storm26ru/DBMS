--SQLQuery2 - GetHour
USE VPD_311_Import;
GO

ALTER FUNCTION GetHour (@group INT) RETURNS TINYINT
BEGIN
	RETURN (SELECT [hours]  FROM Groups,FormOfEducation WHERE form=form_id AND group_id=@group); 
END