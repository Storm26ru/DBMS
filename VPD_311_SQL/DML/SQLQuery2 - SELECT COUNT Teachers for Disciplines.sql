USE VPD_311_Import
GO

SELECT
	[����������] = discipline_name,
	[���������� ��������������] = COUNT(teacher_id)

FROM Disciplines,Teachers,TeachersDisciplinesRelation
WHERE discipline = discipline_id AND teacher = teacher_id
GROUP BY discipline_name;