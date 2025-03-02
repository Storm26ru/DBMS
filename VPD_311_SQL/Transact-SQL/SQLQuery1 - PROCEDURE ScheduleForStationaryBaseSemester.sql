USE VPD_311_Import;
SET DATEFIRST 1;
GO


ALTER PROCEDURE ScheduleForStationaryBase
		@group_name					NVARCHAR(150),
		@discipline_name			NVARCHAR(150),
		@teacher_first_name			NVARCHAR(50),
		@start_date					DATE,
		@time						TIME(0),
		@interval					TINYINT,
		@number_of_hours			TINYINT
AS
BEGIN
		DECLARE @group				AS INT = (SELECT group_id FROM Groups WHERE group_name = @group_name);
		DECLARE @discipline			AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE @discipline_name);
		DECLARE @number_of_lessons	AS TINYINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline);
		DECLARE @teacher			AS SMALLINT = (SELECT teacher_id FROM Teachers WHERE first_name = @teacher_first_name);
		DECLARE @lesson_number		AS TINYINT = 0;
		DECLARE @date				AS DATE = @start_date;
		DECLARE @hours				AS TINYINT = 0;
		DECLARE @break				AS TINYINT =0;
		WHILE(@lesson_number<@number_of_lessons)
		BEGIN
			PRINT(@date);
			PRINT(DATENAME(WEEKDAY,@date));
			PRINT(@discipline_name);
			PRINT(@lesson_number+1);
			PRINT(@time);
			IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [group]=@group AND discipline = @discipline AND [date] = @date AND [time] = @time)
			BEGIN
				WHILE(@hours<@number_of_hours)
				BEGIN
					INSERT Schedule
							([group],discipline,teacher,[date],[time],spent)
					VALUES	(@group,@discipline,@teacher,@date,DATEADD(MINUTE,(80+@break)*@hours,@time),IIF(@date<GETDATE(),1,0));
					SET @hours+=1;
					SET @break+=15;
					SET @lesson_number+=1;
				END
			END
			SET @hours = 0;
			SET @break = 0;
			--PRINT(@lesson_number+1);
			--PRINT(DATEADD(MINUTE,95,@time));
			--IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [group]=@group AND discipline = @discipline AND [date] = @date AND [time] = DATEADD(MINUTE,95,@time))
			--BEGIN
				--INSERT Schedule
					--	([group],discipline,teacher,[date],[time],spent)
				--VALUES	(@group,@discipline,@teacher,@date,DATEADD(MINUTE,95,@time),IIF(@date<GETDATE(),1,0))
			--END
			--SET @lesson_number+=1;
			IF @interval>=7 SET @date = DATEADD(DAY,@interval,@date)
			ELSE IF (DATEPART(WEEKDAY,@date)+@interval)>=7 SET @date = DATEADD(DAY,@interval+1,@date)
				 ELSE SET @date = DATEADD(DAY,@interval,@date);
		END
END