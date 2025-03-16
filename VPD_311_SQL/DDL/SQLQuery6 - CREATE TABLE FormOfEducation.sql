--SQLQuery6 -CREATE TABLE FormOfEducation
USE VPD_311_Import;
GO

CREATE TABLE FormOfEducation 
(
	form_id TINYINT IDENTITY(1,1) PRIMARY KEY,
	form_name NVARCHAR(20) NOT NULL,
	number_of_days TINYINT NOT NULL,
	day_interval TINYINT NOT NULL,
	[break] TINYINT NOT NULL,
	number_of_hours TINYINT NOT NULL,
	[hours] TINYINT NOT NULL
)