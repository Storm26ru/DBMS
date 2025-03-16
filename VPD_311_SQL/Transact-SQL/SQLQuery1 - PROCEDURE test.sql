USE VPD_311_Import;
SET DATEFIRST 1;
GO

--EXEC sp_AddOffDays N'Новогодние каникулы',2025,14;
--EXEC sp_AddOffDays N'23 Февраля',2025,1;
--EXEC sp_AddOffDays N'8 Марта',2025,1;
--EXEC sp_AddOffDays N'Пасха',2025,1;
--EXEC sp_AddOffDays N'Майские%',2025,10;
--EXEC sp_AddOffDays N'Летние%',2025,14;

--EXEC ScheduleForStationaryBase N'PD_212',N'Процедурное%',N'Олег',N'2025-03-06',N'18:30',4;
--EXEC ScheduleForStationaryBase N'PD_212',N'Hard%',N'Олег',N'2025-03-04',N'18:30',4;
EXEC ScheduleForStationaryBase N'VPD_311',N'Hard%',N'Олег',N'2025-03-02',N'12:00',14;
--EXEC ScheduleForStationaryBase N'VPD_311',N'Процедурное программирование %',N'Олег',N'2025-03-09',N'12:00',14;

--EXEC sp_AddHolidays N'8 Марта','2025-03-08',1;
--EXEC sp_AddHolidays N'Пасха','2025-03-15',5;
--EXEC sp_AddHolidays N'Пасха','2025-04-16',5;
--EXEC sp_AddHolidays N'Каникулы','2025-06-28',14

SELECT * FROM OffDays;
SELECT * FROM Holidays;