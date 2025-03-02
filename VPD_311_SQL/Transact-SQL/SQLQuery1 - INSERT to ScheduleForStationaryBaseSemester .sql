USE VPD_311_Import;
GO

SET DATEFIRST 1;
DECLARE @group AS INT = (SELECT group_id FROM Groups WHERE group_name = N'PD_212');
DECLARE @discipline_1 AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'Hard%');
DECLARE @discipline_2 AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'Проц%');
DECLARE @number_of_lessons AS TINYINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline_1);
DECLARE @teacher AS SMALLINT = (SELECT teacher_id FROM Teachers WHERE first_name = N'Олег');
DECLARE @start_date AS DATE = N'2023-09-07';
DECLARE @date AS DATE = @start_date;
DECLARE @time AS TIME(0) = N'18:30';
DECLARE @discipline_day AS SMALLINT = @discipline_2;
DECLARE @lesson_number AS TINYINT = 0;

PRINT(DATEADD(MONTH,2,@start_date));

WHILE (@lesson_number<@number_of_lessons*2)
BEGIN
	SET @discipline_day = IIF(@discipline_day = @discipline_1, @discipline_2, @discipline_1);

	PRINT(@date);
	PRINT(DATENAME(WEEKDAY,@date));
	PRINT(@discipline_day);
	PRINT(@lesson_number+1);
	PRINT(@time);
	INSERT Schedule
			([group],discipline,teacher,[date],[time],spent)
	VALUES	(@group,@discipline_day,@teacher,@date,@time,IIF(@date<GETDATE(),1,0))
	SET @lesson_number+=1;

	PRINT(@lesson_number+1);
	PRINT(DATEADD(MINUTE,95,@time));
	INSERT Schedule
			([group],discipline,teacher,[date],[time],spent)
	VALUES	(@group,@discipline_day,@teacher,@date,DATEADD(MINUTE,95,@time),IIF(@date<GETDATE(),1,0))
	SET @lesson_number+=1;
	IF DATEPART(WEEKDAY,DATEADD(DAY,2,@date)) IN (7,1) SET @date = DATEADD(DAY,3,@date)
	ELSE SET @date = DATEADD(DAY,2,@date);
END