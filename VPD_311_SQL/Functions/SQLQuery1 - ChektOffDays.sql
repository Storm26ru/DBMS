--SQLQuery1 - CheckOffDays
USE VPD_311_Import;
GO

ALTER FUNCTION CheckOffDays(@date DATE) RETURNS BIT
BEGIN
	IF NOT EXISTS (SELECT holiday FROM  OffDays WHERE [date]=@date) RETURN 0
	RETURN 1;
END