USE VPD_311_Import;
GO

SET DATEFIRST 1;

DECLARE @group  AS INT = (SELECT group_id  FROM Groups WHERE group_name = N'VPD_311');
DECLARE @discipline_1 AS SMALLINT = (SELECT discipline_id  FROM Disciplines WHERE discipline_name LIKE N'Hard%');
DECLARE @discipline_2 AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'Проц%');
DECLARE @discipline_3 AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'%Windows');
DECLARE @number_of_lessons_1 AS TINYINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline_1);
--DECLARE @number_of_lessons_2 AS TINYINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline_2);
--DECLARE @number_of_lessons_3 AS TINYINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline_3);
DECLARE @teacher AS SMALLINT = (SELECT teacher_id FROM Teachers WHERE first_name = N'Олег');
DECLARE @start_date AS DATE = N'2023-09-10';
DECLARE @date AS DATE = @start_date;
DECLARE @time AS TIME(0) = N'12:00';
DECLARE @lesson_number AS TINYINT = 0;
DECLARE @discipline_week AS SMALLINT = @discipline_1;
DECLARE @counter AS BIT = 0;

WHILE (@lesson_number<@number_of_lessons_1)
BEGIN
	PRINT(@date);
	PRINT(DATENAME(WEEKDAY,@date));
	PRINT(@discipline_week);
	PRINT(@lesson_number+1);
	PRINT(@time);
	INSERT Schedule
		([group],discipline,teacher,[date],[time],spent)
	VALUES  (@group,@discipline_week,@teacher,@date,@time,IIF(@date<GETDATE(),1,0));
	SET @lesson_number+=1;
	------------------------------------------------------------------------
	PRINT(@lesson_number+1);
	PRINT(DATEADD(MINUTE,95,@time));
	INSERT Schedule
		([group],discipline,teacher,[date],[time],spent)
	VALUES  (@group,@discipline_week,@teacher,@date,DATEADD(MINUTE,95,@time),IIF(@date<GETDATE(),1,0));

	SET @lesson_number+=1;
	------------------------------------------------------------------------
	PRINT(@lesson_number+1);
	PRINT(DATEADD(MINUTE,190,@time));
	INSERT Schedule
		([group],discipline,teacher,[date],[time],spent)
	VALUES  (@group,@discipline_week,@teacher,@date,DATEADD(MINUTE,190,@time),IIF(@date<GETDATE(),1,0));
	SET @lesson_number+=1;
	SET @date = DATEADD(WEEK,1,@date);
	IF (DATEDIFF(WEEK,@start_date,@date)+1)%2=0  SET @discipline_week = @discipline_2
	ELSE IF @counter = 0 
		 BEGIN
			SET @discipline_week = @discipline_3;
			SET @counter = 1;
		 END
		 ELSE 
		 BEGIN
			SET @discipline_week = @discipline_1;
			SET @counter =0;
		 END
END