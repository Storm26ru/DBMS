USE VPD_311_Import
GO

SELECT
		[Ф.И.О. преподователя] = last_name+' '+first_name+' '+middle_name,
		[Количество дисциплин] = COUNT(discipline_id)
FROM Teachers,Disciplines,TeachersDisciplinesRelation
WHERE discipline = discipline_id AND teacher = teacher_id
GROUP BY last_name,first_name,middle_name;