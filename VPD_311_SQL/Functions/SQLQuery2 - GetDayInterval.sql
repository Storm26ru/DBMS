--SQLQuery2 - GetDayInterval
USE VPD_311_Import;
GO

CREATE FUNCTION GetDayInterval(@group INT) RETURNS TINYINT
BEGIN
	RETURN(SELECT day_interval FROM Groups,FormOfEducation WHERE form=form_id AND group_id=@group);
END