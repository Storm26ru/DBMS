USE VPD_311_Import
GO

SELECT 
	[����������� ��������] = direction_name,
	[���������� �������] = SUM (number_of_lessons)
FROM Disciplines,Directions,DisciplinesDirectionsRelation
WHERE direction = direction_id AND discipline = discipline_id
GROUP BY direction_name;