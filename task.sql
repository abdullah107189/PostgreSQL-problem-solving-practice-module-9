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

SELECT * FROM students;
SELECT * FROM departments;