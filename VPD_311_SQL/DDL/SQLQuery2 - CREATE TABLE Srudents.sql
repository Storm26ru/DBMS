USE VPD_311_SQL
GO

CREATE TABLE Students
(
	student_id INT PRIMARY KEY,
	last_name NVARCHAR(50) NOT NULL,
	first_name NVARCHAR(50) NOT NULL,
	middle_name NVARCHAR(50) NULL,
	birth_date DATE NOT NULL,
	[group] INT NULL
	CONSTRAINT FK_Students_Groups FOREIGN KEY REFERENCES Groups(group_id) 
)