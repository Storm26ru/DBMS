USE VPD_311_Import;
SET DATEFIRST 1;
GO

EXEC ScheduleForStationaryBase N'PD_212',N'Hard%',N'Олег',N'2023-09-07',N'18:30',4,2;
EXEC ScheduleForStationaryBase N'PD_212',N'Процедурное%',N'Олег',N'2023-09-09',N'18:30',4,2;
--EXEC ScheduleForStationaryBase N'VPD_311',N'Hard%',N'Олег',N'2023-09-10',N'12:00',14,3;
--EXEC ScheduleForStationaryBase N'VPD_311',N'Процедурное программирование %',N'Олег',N'2023-09-17',N'12:00',14,3;