--SQLQuery5 - CREATE TABLS Holidays
USE VPD_311_Import
GO

CREATE TABLE Holidays
(
	holiday_id SMALLINT IDENTITY(1,1) PRIMARY KEY,
	name_holiday NVARCHAR(30) NOT NULL,
	[month] TINYINT CONSTRAINT CK_Month CHECK ([month]>0 AND [month]<= 12),
	[day]	TINYINT CONSTRAINT CK_Day CHECK ([day]>0 AND [day]<= 31)
);

CREATE TABLE OffDays
(
	holiday SMALLINT CONSTRAINT FK_OffDays_Holidays FOREIGN KEY REFERENCES Holidays(holiday_id),
	[date] DATE PRIMARY KEY
);