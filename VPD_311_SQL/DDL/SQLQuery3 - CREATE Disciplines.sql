USE VPD_311_SQL
GO

CREATE TABLE Disciplines
(
	discipline_id SMALLINT PRIMARY KEY,
	discipline_name NVARCHAR(150) NOT NULL,
	number_of_lessons TINYINT NOT NULL
);
GO

CREATE TABLE RequiredDisciplines
(
	discipline SMALLINT,
	required_discipline SMALLINT,
	PRIMARY KEY (discipline, required_discipline),
	CONSTRAINT FK_RD_Discipline_2_Discipline FOREIGN KEY (discipline) REFERENCES Disciplines(discipline_id),
	CONSTRAINT FK_RD_Required_2_Discipline  FOREIGN KEY (required_discipline) REFERENCES Disciplines(discipline_id)
);

CREATE TABLE TeachersDisciplinesRelation
(
	teacher INT,
	discipline SMALLINT,
	PRIMARY KEY (teacher,discipline),
	CONSTRAINT FK_TDR_Teachers FOREIGN KEY (teacher) REFERENCES Teachers(teacher_id),
	CONSTRAINT FK_TDR_Disciplines FOREIGN KEY (discipline) REFERENCES Disciplines(discipline_id)
);

CREATE TABLE DisciplinesDirectionRelation
(
	discipline SMALLINT,
	direction TINYINT,
	PRIMARY KEY (discipline, direction),
	CONSTRAINT FK_DDR_Disciplines FOREIGN KEY (discipline) REFERENCES Disciplines (discipline_id),
	CONSTRAINT FK_DDR_Directions FOREIGN KEY (direction) REFERENCES Directions(direction_id)
);
GO