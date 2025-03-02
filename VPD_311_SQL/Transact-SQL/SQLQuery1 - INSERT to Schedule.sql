USE VPD_311_Import;
GO

SET DATEFIRST 1; -- Первый день недели - Понедельник

DECLARE @group				AS INT		= (SELECT group_id			 FROM Groups	  WHERE group_name		= N'VPD_311');
DECLARE @discipline			AS SMALLINT = (SELECT discipline_id		 FROM Disciplines WHERE discipline_name LIKE N'Объектно%');
DECLARE @number_of_lessons  AS TINYINT  = (SELECT number_of_lessons  FROM Disciplines WHERE discipline_id	= @discipline);
DECLARE @teacher			AS SMALLINT = (SELECT teacher_id		 FROM Teachers	  WHERE first_name		= N'Олег');
DECLARE @start_date			AS DATE		= N'2024-04-07';
DECLARE @date				AS DATE		= @start_date;
DECLARE @time				AS TIME(0)	= N'12:00';

PRINT (@group);
PRINT (@discipline);
PRINT (@number_of_lessons);
PRINT (@teacher);
PRINT (@start_date);
PRINT (@time);
PRINT ('===============================================');

DECLARE @lesson_number AS TINYINT = 0;
WHILE (@lesson_number<@number_of_lessons)
BEGIN
	PRINT(@date);
	PRINT(DATENAME(WEEKDAY,@date));
	PRINT(@lesson_number+1);
	PRINT(@time);

	INSERT Schedule
			([group],discipline,teacher,[date],[time],spent)
	VALUES  (@group,@discipline,@teacher,@date,@time,IIF(@date<GETDATE(),1,0));
	SET @lesson_number+=1;

	---------------------------------------------------------------------------

	PRINT(@lesson_number+1);
	PRINT(DATEADD(MINUTE,95,@time));

	INSERT Schedule
			([group],discipline,teacher,[date],[time],spent)
	VALUES	(@group,@discipline,@teacher,@date, DATEADD(MINUTE,95,@time),IIF(@date<GETDATE(),1,0));
	SET @lesson_number+=1;

	----------------------------------------------------------------------------

	PRINT(@lesson_number+1);
	PRINT(DATEADD(MINUTE,190,@time));

	INSERT Schedule
			([group],discipline,teacher,[date],[time],spent)
	VALUES	(@group,@discipline,@teacher,@date, DATEADD(MINUTE,190,@time),IIF(@date<GETDATE(),1,0));
	SET @lesson_number+=1;
	PRINT('------------------------------------------------');
	SET @date = DATEADD(WEEK,1,@date);
END