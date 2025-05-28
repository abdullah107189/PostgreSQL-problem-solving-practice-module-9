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
)

INSERT INTO students ("name", d_id, last_login) VALUES
('Alice Johnson', 1, '2023-10-01'),
('Bob Smith', 2, '2023-10-02'),
('Charlie Brown', 1, '2023-10-03'),
('Diana Prince', 3, '2023-10-04'),
('Ethan Hunt', 2, '2023-10-05');

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

