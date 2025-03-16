USE VPD_311_Import;
GO

ALTER PROCEDURE sp_AddHolidays
	@name_holiday		NVARCHAR(30),
	@start_date			DATE,
	@number_of_days		TINYINT
AS
BEGIN
	DECLARE @date DATE = @start_date;
	DECLARE @day_number TINYINT = 0;
	DECLARE @holiday_id SMALLINT;
	IF NOT EXISTS (SELECT holiday_id FROM Holidays WHERE name_holiday = @name_holiday)
	BEGIN
		INSERT Holidays
				(name_holiday)
		VALUES	(@name_holiday);
	END
	SET @holiday_id = dbo.GetHolidayId(@name_holiday);
	WHILE(@day_number<@number_of_days)
	BEGIN
		IF NOT EXISTS (SELECT holiday FROM OffDays WHERE holiday=@holiday_id AND [date]=@date)
		BEGIN
			INSERT OffDays
						(holiday,[date])
			VALUES		(@holiday_id,@date);
		END
		--IF dbo.CheckScheldule(@date) = 1 DELETE Schedule WHERE [date] = @date;
		SET @day_number+=1;
		SET @date = DATEADD(DAY,1,@date);
	END
END