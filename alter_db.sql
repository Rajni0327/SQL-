
--CREATING A TABLE 

CREATE TABLE students (
student_id SERIAL PRIMARY KEY ,
name VARCHAR (100),
age BIGINT
);


INSERT INTO students (name , age )
VALUES ('Akarsh' , 23),
		('Samriti',25);


-- ADD a new column 

ALTER TABLE students 
ADD COLUMN Email VARCHAR(100) DEFAULT 'not provided';



-- DELETE a column 

ALTER TABLE students 
DROP COLUMN Email ;



--RENAME a column

ALTER TABLE students 
RENAME COLUMN name TO full_name ;



--CHANGE DATATPE of a column 

ALTER TABLE students 
ALTER COLUMN age TYPE smallint ; 



-- SET a DEFAULt value 
ALTER TABLE students 
ALTER COLUMN age SET DEFAULT 18;



-- Remove default column




























SELECT * FROM  students ;











