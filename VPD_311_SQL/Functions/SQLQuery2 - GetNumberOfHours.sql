--SQLQuery2 - GetNumberOfHours
USE VPD_311_Import;
GO

ALTER FUNCTION GetNumbreOfHourse (@group INT) RETURNS TINYINT
BEGIN
	RETURN (SELECT number_of_hours  FROM Groups,FormOfEducation WHERE form=form_id AND group_id=@group); 
END