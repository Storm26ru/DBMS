USE VPD_311_Import;
SET DATEFIRST 1;
GO


ALTER PROCEDURE ScheduleForStationaryBase
		@group_name					NVARCHAR(150),
		@discipline_name			NVARCHAR(150),
		@teacher_first_name			NVARCHAR(50),
		@start_date					DATE,
		@time						TIME(0),
		@interval					TINYINT
AS
BEGIN
		DECLARE @group				AS INT = (SELECT group_id FROM Groups WHERE group_name = @group_name);
		DECLARE @discipline			AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE @discipline_name);
		DECLARE @number_of_lessons	AS TINYINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline);
		DECLARE @teacher			AS SMALLINT = (SELECT teacher_id FROM Teachers WHERE first_name = @teacher_first_name);
		DECLARE @lesson_number		AS TINYINT = 0;
		DECLARE @date				AS DATE = @start_date;
		DECLARE @number_of_hours	AS TINYINT = dbo.GetNumbreOfHourse(@group);
		DECLARE @hours				AS TINYINT = 0;
		DECLARE @break				AS TINYINT =0;
		DECLARE @day_interval		AS TINYINT = dbo.GetDayInterval(@group);
		IF EXISTS (SELECT*FROM Schedule WHERE [group]=@group AND discipline = @discipline AND [date] = @date AND [time] = @time) RETURN;
		WHILE(@lesson_number<@number_of_lessons)
		BEGIN
			IF dbo.CheckOffDays(@date) = 0
			BEGIN
				IF EXISTS (SELECT * FROM Schedule WHERE [group]=@group AND discipline!=@discipline AND [date] = @date)
				BEGIN	
				IF @interval>=7 SET @date = DATEADD(DAY,@day_interval,@date)
				ELSE IF(DATEPART(WEEKDAY,@date)+@day_interval)>=7 SET @date = DATEADD(DAY,@day_interval+1,@date);
					 ELSE SET @date = DATEADD(DAY,@day_interval,@date);
				END
				IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [group]=@group AND discipline = @discipline AND [date] = @date AND [time] = @time)
				BEGIN
					WHILE(@hours<@number_of_hours)
					BEGIN
						INSERT Schedule
								([group],discipline,teacher,[date],[time],spent)
						VALUES	(@group,@discipline,@teacher,@date,DATEADD(MINUTE,(dbo.GetHour(@group)+@break)*@hours,@time),IIF(@date<GETDATE(),1,0));
						SET @hours+=1;
						SET @break+=dbo.GetBreak(@group);
						SET @lesson_number+=1;
					END
				SET @hours = 0;
				SET @break = 0;
				END
				ELSE SET @lesson_number+=@number_of_hours;
				IF @interval>=7 SET @date = DATEADD(DAY,@interval,@date)
				ELSE IF (DATEPART(WEEKDAY,@date)+@interval)>=7 SET @date = DATEADD(DAY,@interval+1,@date)
					 ELSE SET @date = DATEADD(DAY,@interval,@date);
			END
			ELSE 
			BEGIN
				IF @interval>=7 SET @date = DATEADD(DAY,@day_interval,@date)
				ELSE IF(DATEPART(WEEKDAY,@date)+@day_interval)>=7 SET @date = DATEADD(DAY,@day_interval+1,@date);
					 ELSE SET @date = DATEADD(DAY,@day_interval,@date);
				IF EXISTS (SELECT * FROM Schedule WHERE [group]=@group AND discipline!=@discipline AND [date] = @date)
				BEGIN
					DECLARE @discipline_id_temp SMALLINT = dbo.GetDisciplineInScheldule(@group,@date,@discipline);
					DECLARE @discipline_name_temp NVARCHAR(150) =dbo.GetDisciplineName(@discipline_id_temp);
					DECLARE @teacher_temp NVARCHAR(50) = dbo.GetTeacherFirstName(@group,@date,@discipline_id_temp);
					DECLARE @interval_temp TINYINT =dbo.GetInterval(@group,@discipline_id_temp,@date);
					DECLARE @number_of_lessons_temp TINYINT = dbo.GetNumberOfLessons(@group,@discipline_id_temp,@date);
					DELETE Schedule WHERE [group]= @group AND discipline=@discipline_id_temp AND [date]>=@date;
					EXEC sp_ReSchelduling @group_name,@discipline_name_temp,@teacher_temp,@date,@time,@interval_temp,@number_of_lessons_temp;
				END
			END
			
		END
END