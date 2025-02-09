USE VPD_311_SQL
GO
CREATE TABLE Teachers
(
	teacher_id INT PRIMARY KEY,
	last_name NVARCHAR(50) NOT NULL,
	first_name NVARCHAR(50) NOT NULL,
	middle_name NVARCHAR(50) NULL,
	birth_date DATE NOT NULL,
	work_sinse DATE NOT NULL
);