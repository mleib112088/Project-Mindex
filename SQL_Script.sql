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
SELECT SUM(ml."Boyd_Yards") AS "Boyd Yards", SUM(ml."Higgins_Yards") AS "Higgins Yards", SUM(ml."Chase_Yards") AS "Chase Yards", 
coalesce(c1."Win", 0) as "Win", coalesce(c2."Loss",0) as "Loss"
INTO TEMPORARY table mytable
FROM michael_leib ml
left JOIN CTE1 c1 ON c1."Result" = ml."Result"  
left JOIN CTE2 c2 ON c2."Result" = ml."Result" 
group by 4,5

--execute statement above first, then run statement below

select sum("Boyd Yards") as "Boyd Yards", sum("Higgins Yards") as "Higgins Yards", sum("Chase Yards") as "Chase Yards", (sum("Win") || '-' || sum("Loss")) as "Win/Loss"
from mytable

--remove temp table by dropping afterwards

--drop table mytable
