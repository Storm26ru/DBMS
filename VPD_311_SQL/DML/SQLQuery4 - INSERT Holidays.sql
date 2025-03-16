--SQLQuery4 - INSERT Holidays
USE VPD_311_Import;
GO

INSERT Holidays
		(name_holiday,[month],[day])
VALUES	(N'Новогодние каникулы',NULL,NULL),
		(N'23 Февраля',2,23),
		(N'8 Марта',3,8),
		(N'Пасха',NULL,NULL),
		('Майские праздники',NULL,NULL),
		('Летние каникулы',NULL,NULL);