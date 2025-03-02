USE VPD_311_Import
GO

SELECT 
	 [Направление обучения] = D.direction_name,
	 [Количество преподавателей] = COUNT(DISTINCT TDR.teacher)
FROM Directions AS D
JOIN DisciplinesDirectionsRelation AS DDR ON D.direction_id = DDR.direction
JOIN TeachersDisciplinesRelation AS TDR ON DDR.discipline = TDR.discipline
GROUP BY D.direction_name;