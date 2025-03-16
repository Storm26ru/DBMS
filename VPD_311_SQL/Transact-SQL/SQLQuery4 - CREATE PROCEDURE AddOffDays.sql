--SQLQuery4 - CREATE PROCEDURE AddOffDays
USE VPD_311_Import;
GO

ALTER PROCEDURE sp_AddOffDays
	@name_holiday NVARCHAR(30),
	@year SMALLINT,
	@namber_of_days TINYINT
AS
BEGIN
	DECLARE 
			@holiday TINYINT = (SELECT holiday_id FROM Holidays WHERE name_holiday LIKE @name_holiday),
			@date DATE = dbo.GetStartDate(@name_holiday,@year),
			@day TINYINT = 0;
	--PRINT('Дата');
	--PRINT(@date);
	WHILE(@day<@namber_of_days)
	BEGIN
		INSERT OffDays
				(holiday,[date])
		VALUES	(@holiday,@date);
		SET @day+=1;
		SET @date = DATEADD(DAY,1,@date);
	END
END