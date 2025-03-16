--SQLQuery3 - INSERT FormOfEducation
USE VPD_311_Import;
GO

INSERT FormOfEducation
		(form_name,number_of_days,day_interval,[break],number_of_hours,[hours])
VALUES	(N'Стационар',3,2,15,2,80),
		(N'Полустационар',1,7,15,3,80);