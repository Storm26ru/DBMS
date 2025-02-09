USE VPD_311_SQL;
GO

CREATE TABLE Schedule
(
	lesson_id  BIGINT PRIMARY KEY,
	[date] DATE NOT NULL,
	[time] TIME NOT NULL,
	[group] INT NOT NULL CONSTRAINT FK_Schedule_Groupd FOREIGN KEY REFERENCES Groups(group_id),
	discipline SMALLINT NOT NULL CONSTRAINT FK_Schedule_Disciplines FOREIGN KEY REFERENCES Disciplines(discipline_id),
	teacher INT NOT NULL CONSTRAINT FK_Schedule_Teachers FOREIGN KEY REFERENCES Teachers(teacher_id),
	[subject] NVARCHAR(256) NULL,
	spent BIT NOT NULL,
);


CREATE TABLE Grades
(
	student INT CONSTRAINT FK_Grades_Students FOREIGN KEY REFERENCES Students(student_id),
	lesson BIGINT CONSTRAINT FK_Grades_Schedule FOREIGN KEY REFERENCES Schedule(lesson_id),
	PRIMARY KEY(student,lesson),
	present BIT NOT NULL,
	grade1 TINYINT  NULL CONSTRAINT CK_Grades_1 CHECK (grade1>0 AND grade1<= 12),
	grade2 TINYINT NULL CONSTRAINT CK_Grades_2 CHECK (grade2>0 AND grade2<= 12)
);

CREATE TABLE Exams
(
	student INT CONSTRAINT FK_Exams_Students FOREIGN KEY REFERENCES Students(student_id),
	discipline SMALLINT CONSTRAINT FK_Exams_Disciplines FOREIGN KEY REFERENCES Disciplines(discipline_id),
	PRIMARY KEY(student,discipline),
	grade TINYINT CONSTRAINT CK_Exams_Grade  CHECK (grade>0 AND grade <=12)
);
GO