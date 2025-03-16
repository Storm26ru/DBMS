--SQLQuery3 - GetNumberOfLessons
USE VPD_311_Import;
GO

CREATE FUNCTION GetNumberOfLessons (@group INT,@discipline_id SMALLINT,@date DATE) REtURNS INT
BEGIN
	RETURN (SELECT COUNT([date]) FROM Schedule WHERE [group]=@group AND discipline=@discipline_id AND [date]>=@date);
END