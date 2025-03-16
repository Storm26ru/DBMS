--SQLQuery3 - GetInterval
USE VPD_311_Import;
GO

ALTER FUNCTION GetInterval (@group INT,@discipline_id SMALLINT,@date DATE) RETURNS TINYINT
BEGIN
	DECLARE @number_of_lesson TINYINT = (SELECT COUNT([date]) FROM Schedule WHERE [group]=@group AND discipline=@discipline_id AND [date]>=@date);
	DECLARE @number_of_day TINYINT = DATEDIFF(DAY,@date,(SELECT MAX([date]) FROM Schedule WHERE [group]=@group AND discipline=@discipline_id AND [date]>@date ));
	DECLARE @number_of_offday TINYINT = (SELECT COUNT([date]) FROM OffDays WHERE [date]>=@date);
	DECLARE @lessons_per_day TINYINT = (SELECT number_of_hours FROM Groups,FormOfEducation WHERE [group_id]=@group AND form_id = form);
	RETURN (@number_of_day-@number_of_offday)/(@number_of_lesson/@lessons_per_day);
END