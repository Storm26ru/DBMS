USE VPD_311_Import
GO

SELECT
		[�.�.�. �������������] = last_name+' '+first_name+' '+middle_name,
		[���������� ���������] = COUNT(discipline_id)
FROM Teachers,Disciplines,TeachersDisciplinesRelation
WHERE discipline = discipline_id AND teacher = teacher_id
GROUP BY last_name,first_name,middle_name;