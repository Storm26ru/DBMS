--SQLQuery3 - GetDisciplineInScheldule
USE VPD_311_Import;
GO

ALTER FUNCTION GetDisciplineInScheldule (@group_id INT,@date DATE,@discipline SMALLINT ) RETURNS SMALLINT
BEGIN
	RETURN (SELECT discipline FROM Schedule WHERE discipline! = @discipline AND [date]=@date AND [group]=@group_id GROUP BY discipline);
END