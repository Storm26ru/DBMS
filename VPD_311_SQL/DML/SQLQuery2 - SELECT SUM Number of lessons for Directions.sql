USE VPD_311_Import
GO

SELECT 
	[Направление обучения] = direction_name,
	[Количество занятий] = SUM (number_of_lessons)
FROM Disciplines,Directions,DisciplinesDirectionsRelation
WHERE direction = direction_id AND discipline = discipline_id
GROUP BY direction_name;