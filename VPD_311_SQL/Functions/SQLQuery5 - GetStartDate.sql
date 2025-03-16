--SQLQuery5 - GetStartDate
USE VPD_311_Import;
SET DATEFIRST 1;
GO

ALTER FUNCTION GetStartDate (@holiday_name NVARCHAR(30),@year SMALLINT) RETURNS DATE
BEGIN
	DECLARE
			@month TINYINT = (SELECT [month] FROM Holidays WHERE name_holiday LIKE @holiday_name),
			@day TINYINT = (SELECT [day] FROM Holidays WHERE name_holiday LIKE @holiday_name);
	DECLARE 
			@date  DATE = 
	(
		CASE
		  WHEN @holiday_name LIKE N'Новогод%' THEN DATEADD(DAY,-1,DATEFROMPARTS(@year,01,01))
		  WHEN @holiday_name LIKE N'Пасха%'	  THEN DATEFROMPARTS(@year,04,20)
		  WHEN @holiday_name LIKE N'Майск%'	  THEN DATEFROMPARTS(@year,05,01)
		  WHEN @holiday_name LIKE N'Летние%'  THEN IIF(DATEPART(WEEKDAY,DATEFROMPARTS(@year,07,31)) = 1,DATEFROMPARTS(@year,07,31),DATEADD(DAY,-(DATEPART(WEEKDAY,DATEFROMPARTS(@year,07,31)))+1,DATEFROMPARTS(@year,07,31)))
		  ELSE DATEFROMPARTS(@year,@month,@day)
		 -- WHEN @month!= NULL AND @day!=NULL	  THEN DATEFROMPARTS(@year,@month,@day)
		END
	)
	RETURN @date;
END