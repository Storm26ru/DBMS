--SQLQuery2 - GetBreak
USE VPD_311_Import;
GO

ALTER FUNCTION GetBreak (@group INT) RETURNS TINYINT
BEGIN
	RETURN(SELECT [break] FROM Groups,FormOfEducation WHERE form=form_id AND group_id=@group);
END