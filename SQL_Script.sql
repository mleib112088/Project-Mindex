WITH CTE1(
SELECT Result, count(*) as 'Win'
WHERE Result = 'Win'
GROUP BY Result
);

WITH CTE2(
SELECT Result, count(*) as 'Loss'
WHERE Result = 'Loss'
GROUP BY Result
);

SELECT SUM(ml.Boyd_Yards) AS 'Boyd Yards', SUM(ml.Higgins_Yards) AS 'Higgins Yards', SUM(ml.Chase_Yards) AS 'Chase Yards', (c1.Win + '-' + c2.Loss) as 'Win/Loss'
FROM michael_leib ml
LEFT JOIN CTE1 c1 ON c1.Result = ml.Result  
LEFT JOIN CTE2 c2 ON c2.Result = ml.Result  
