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


