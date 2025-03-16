USE VPD_311_Import;
GO

--DELETE OffDays;
DELETE Schedule;
--DELETE Holidays;
--DROP TABLE OffDays;
--DROP TABLE Holidays;
--DROP TABLE FormOfEducation

--SELECT * FROM Groups;
--SELECT * FROM FormOfEducation
--SELECT [date] =  MAX (D) FROM (SELECT TOP (4) [date] AS 'D' FROM Schedule WHERE discipline = 31 AND [date]>='2025-03-11') AS N
--SELECT [date] FROM Schedule WHERE discipline=1;
--PRINT(DATEDIFF(DAY,'2025-03-13','2025-09-02'));
--DECLARE @Y DATE = '2025';
--SET @Y = DATEADD(MONTH,DAY,3,4,@Y);
--PRINT(@Y);