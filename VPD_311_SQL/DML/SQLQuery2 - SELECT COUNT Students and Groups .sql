USE VPD_311_Import
GO


SELECT 
		[Направление обучения] = direction_name,
		[Количество групп] = [Количество гупп],
		[Количество студентов] = [Количество студентов]

FROM Directions,
(SELECT 
		direction,
		[Количество гупп]		= COUNT(group_id)
FROM Groups, Directions
WHERE direction = direction_id
GROUP BY direction) AS G,
(SELECT 
		direction,
		[Количество студентов] = COUNT(stud_id)
FROM Groups,Directions,Students
WHERE direction = direction_id AND group_id = [group] 
GROUP BY direction) AS S
WHERE G.direction=direction_id AND S.direction = direction_id;

