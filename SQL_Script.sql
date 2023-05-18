WITH CTE1 AS (
	SELECT "Result", count(*) AS "Win"
	FROM michael_leib ml2 
	WHERE "Result" = 'Win'
	GROUP BY "Result"
),
CTE2 AS (
	SELECT "Result", count(*) AS "Loss"
	FROM michael_leib ml3 
	WHERE "Result" = 'Loss'
	GROUP BY "Result"
) 
SELECT SUM(ml."Boyd_Yards") AS "Boyd Yards", SUM(ml."Higgins_Yards") AS "Higgins Yards", SUM(ml."Chase_Yards") AS "Chase Yards", string_agg((cast(c1."Win" as varchar) || cast(c2."Loss" as varchar)),',')
FROM michael_leib ml
left JOIN CTE1 c1 ON c1."Result" = ml."Result"  
left JOIN CTE2 c2 ON c2."Result" = ml."Result" 