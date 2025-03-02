USE VPD_311_Import
GO

SELECT
	[Дисциплины] = discipline_name,
	[Количество преподователей] = COUNT(teacher_id)

FROM Disciplines,Teachers,TeachersDisciplinesRelation
WHERE discipline = discipline_id AND teacher = teacher_id
GROUP BY discipline_name;