CREATE DATABASE college_management;
USE college_management;
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    department VARCHAR(50),
    admission_date DATE
);
CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credits INT,
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO students (first_name, last_name, email, phone, department, admission_date)
VALUES
('Arun', 'Kumar', 'arun@gmail.com', '9876543210', 'Computer Science', '2023-06-10'),
('Priya', 'Sharma', 'priya@gmail.com', '9123456780', 'Information Technology', '2023-06-12'),
('Rahul', 'Verma', 'rahul@gmail.com', '9988776655', 'Electronics', '2023-06-15');
INSERT INTO faculty (name, email, department, salary)
VALUES
('Dr. Meena', 'meena@college.com', 'Computer Science', 75000),
('Mr. Raj', 'raj@college.com', 'Information Technology', 65000);
INSERT INTO courses (course_name, credits, faculty_id)
VALUES
('Database Management System', 4, 1),
('Web Development', 3, 2);
INSERT INTO enrollments (student_id, course_id, grade)
VALUES
(1, 1, 'A'),
(2, 2, 'B'),
(3, 1, 'A');
SELECT * FROM students;
SELECT s.first_name, s.last_name, c.course_name, e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;
SELECT f.name, c.course_name
FROM faculty f
JOIN courses c ON f.faculty_id = c.faculty_id;
