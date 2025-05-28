-- Active: 1748101600106@@127.0.0.1@5432@practice
CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(50),
    d_id INTEGER REFERENCES departments(id), 
    last_login DATE
)

CREATE TABLE departments(
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(50)
)

CREATE TABLE courses(
    id SERIAL PRIMARY KEY,
    title TEXT
);
INSERT INTO students ("name", d_id, last_login) VALUES
('Alice Johnson', 1, '2025-5-15'),
('Bob Smith', 2, '2025-4-02'),
('Charlie Brown', 1, '2025-4-30'),
('Diana Prince', 3, '2025-5-04'),
('Ethan Hunt', 2, '2025-3-05');

INSERT INTO departments ("name") VALUES
('Computer Science'),
('Mathematics'),
('Physics'),
('Chemistry'),
('Biology');

INSERT INTO courses (title) VALUES
('Introduction to Computer Science'),
('Calculus I'),
('General Physics'),
('Organic Chemistry'),
('Molecular Biology'),
('Data Structures'),
('Linear Algebra'),
('Quantum Mechanics'),
('Physical Chemistry'),
('Genetics');

SELECT * FROM students;
SELECT * FROM departments;
SELECT * FROM courses;


------==========---------===========----------============---------
-- 1. Retrieve students who have logged in within the last 30 days.
SELECT * FROM students
    WHERE last_login >=  CURRENT_DATE - INTERVAL '30 days';

-- 2. Extract the login month from the last_login and group students by month.
SELECT extract(MONTH FROM last_login) as month_show FROM students
    GROUP BY month_show;

-- bonus solution
SELECT 
    to_char(DATE_TRUNC('month', last_login), 'Month') AS month_name
FROM students
    GROUP BY month_name;


-- 3. Count how many students logged in per month and show only those months where login count is more than 3.
SELECT extract(MONTH from last_login) as last_year, count(*) FROM students
GROUP BY last_year
HAVING count(*) > 3;


------==========---------===========----------============---------
-- 4. Create a foreign key constraint on department_id in the students table referencing departments(id).
-- ✅ REFERENCES departments(id) দিয়ে টেবিল already created, তখনই Foreign Key Constraint তৈরি হয়ে গেছে।
-- ⛔ তাই আবার দিতে গেলে error দিবে (Duplicate constraint)।

-- 5.Try inserting a student with a department_id that doesn’t exist and observe the behavior.
INSERT INTO students("name", d_id, last_login) VALUES('test', 22,'2025-05-01');
-- error is ----> Error: insert or update on table "students" violates foreign key constraint "students_d_id_fkey".

-- 6. Delete a department and see how students are affected using ON DELETE CASCADE and ON DELETE SET NULL.
SELECT * FROM departments;
SELECT * FROM students;
ALTER TABLE students
DROP constraint students_d_id_fkey;

ALTER TABLE students
ADD constraint students_d_id_fkey
Foreign Key (d_id) REFERENCES departments(id)
on delete CASCADE;

DELETE FROM departments
    WHERE id = 1;

-- now null style delete
ALTER TABLE students
DROP constraint students_d_id_fkey;

ALTER TABLE students
ADD constraint students_d_id_fkey
Foreign Key (d_id) REFERENCES departments(id)
on delete set NULL;

DELETE FROM departments
    WHERE id =2;

SELECT * FROM students;
SELECT * FROM departments;

------==========---------===========----------============---------
-- 7. Join students and departments using INNER JOIN to display each student's department name.
SELECT * FROM students as s
INNER JOIN departments on s.d_id = departments.id;

-- another way but not working because students id is "d_id" and departments id is "id" . When id is match then it was match! other wise not match the id.
SELECT * FROM students
JOIN departments USING(id) 