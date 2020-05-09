/*Multiple Inner Join:*/
SELECT students.name,students.rollno,course.cname,marks.M1,marks.M2,marks.M3 FROM students INNER JOIN course ON students.cid=course.cid INNER JOIN marks ON students.id=marks.id;




/*Simple Dynamic Marklist using Queries:*/

SELECT students.name,students.rollno,
course.cname as Course,
marks.M1,marks.M2,marks.M3,
(marks.M1,marks.M2,marks.M3) AS Total,
ROUND(((marks.M1,marks.M2,marks.M3)/3),2) AS Average
CASE
	WHEN marks.M1 >= 35 AND marks.M2 >= 35 AND marks.M3 >= 35 THEN 'PASS'
	ELSE 'FAIL'
END AS Result,
CASE
	WHEN marks.M1 >= 35 AND marks.M2 >= 35 AND marks.M3 >= 35 THEN
		CASE
			WHEN ROUND(((marks.M1,marks.M2,marks.M3)/3),2) >= 90 AND ROUND(((marks.M1,marks.M2,marks.M3)/3),2) < = 100 THEN 'A'
			WHEN ROUND(((marks.M1,marks.M2,marks.M3)/3),2) >= 80 AND ROUND(((marks.M1,marks.M2,marks.M3)/3),2) < = 89 THEN 'B'
			ELSE
			'C'
		END
	ELSE 'NO GRADE'
END AS Result,
 FROM students INNER JOIN course ON students.cid=course.cid INNER JOIN marks ON students.id=marks.id;
 
 
 
/*To use dynamically Created column names:*/

 SELECT students.name,students.rollno,
course.cname as Course,
marks.M1,marks.M2,marks.M3,
(marks.M1,marks.M2,marks.M3) AS Total,
ROUND(((marks.M1,marks.M2,marks.M3)/3),2) AS Average
CASE
	WHEN marks.M1 >= 35 AND marks.M2 >= 35 AND marks.M3 >= 35 THEN 'PASS'
	ELSE 'FAIL'
END AS Result,
CASE
	WHEN marks.M1 >= 35 AND marks.M2 >= 35 AND marks.M3 >= 35 THEN
		CASE
			WHEN ROUND(((marks.M1,marks.M2,marks.M3)/3),2) >= 90 AND ROUND(((marks.M1,marks.M2,marks.M3)/3),2) < = 100 THEN 'A'
			WHEN ROUND(((marks.M1,marks.M2,marks.M3)/3),2) >= 80 AND ROUND(((marks.M1,marks.M2,marks.M3)/3),2) < = 89 THEN 'B'
			ELSE
			'C'
		END
	ELSE 'NO GRADE'
END AS Result,
 FROM students INNER JOIN course ON students.cid=course.cid INNER JOIN marks ON students.id=marks.id WHERE course.cname='BCA' having Result = 'PASS' AND (Average >= 70 AND Average <= 100);
 
 
 
/*Creating queries as View:*/
 
CREATE VIEW Reports AS
SELECT students.name,students.rollno,
course.cname as Course,
marks.M1,marks.M2,marks.M3,
(marks.M1,marks.M2,marks.M3) AS Total,
ROUND(((marks.M1,marks.M2,marks.M3)/3),2) AS Average
CASE
	WHEN marks.M1 >= 35 AND marks.M2 >= 35 AND marks.M3 >= 35 THEN 'PASS'
	ELSE 'FAIL'
END AS Result,
CASE
	WHEN marks.M1 >= 35 AND marks.M2 >= 35 AND marks.M3 >= 35 THEN
		CASE
			WHEN ROUND(((marks.M1,marks.M2,marks.M3)/3),2) >= 90 AND ROUND(((marks.M1,marks.M2,marks.M3)/3),2) < = 100 THEN 'A'
			WHEN ROUND(((marks.M1,marks.M2,marks.M3)/3),2) >= 80 AND ROUND(((marks.M1,marks.M2,marks.M3)/3),2) < = 89 THEN 'B'
			ELSE
			'C'
		END
	ELSE 'NO GRADE'
END AS Result,
FROM students INNER JOIN course ON students.cid=course.cid INNER JOIN marks ON students.id=marks.id;
 
/*Accessing views like a table:*/
 SELECT * FROM Reports;
 SELECT * FROM Reports WHERE Result = 'PASS';
 
 
 /*Update table using Inner Join:*/
 
 UPDATE marks INNER JOIN students ON students.id = marks.id SET M1 = 100,M2 = 100,M3 = 100 WHERE students.rollno = 'A1001';
 
 
/*Creating Triggers:*/
CREATE TRIGGER before_products_update
	BEFORE UPDATE ON product
	FOR EACH ROW
BEGIN 
	INSERT INTO price_logs(pid,price,new_price)
	VALUES(old.pid,old.rate,new.rate);
END$$