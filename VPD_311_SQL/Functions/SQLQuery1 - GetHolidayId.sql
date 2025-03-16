--SQLQuery1 - GetOffDays
USE VPD_311_Import;
GO

CREATE FUNCTION GetHolidayId(@name_holiday NVARCHAR(30)) RETURNS SMALLINT
BEGIN
	RETURN (SELECT holiday_id  FROM Holidays WHERE name_holiday = @name_holiday);
END