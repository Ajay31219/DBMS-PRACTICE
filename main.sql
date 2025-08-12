-- Create Department3 table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE
);

-- Create Course table
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Insert sample departments
INSERT INTO Department (dept_id, dept_name)
VALUES 
(1, 'Computer Science'),
(2, 'Electrical'),
(3, 'Mechanical'),
(4, 'Civil'),
(5, 'Electronics');

-- Insert sample courses
INSERT INTO Course (course_id, course_name, dept_id)
VALUES
(101, 'DBMS', 1),
(102, 'Operating Systems', 1),
(103, 'Power Systems', 2),
(104, 'Digital Circuits', 2),
(105, 'Thermodynamics', 3),
(106, 'Fluid Mechanics', 3),
(107, 'Structural Engineering', 4),
(108, 'Surveying', 4),
(109, 'Embedded Systems', 5),
(110, 'VLSI Design', 5);

SELECT dept_name
FROM Department
WHERE dept_id IN (
    SELECT dept_id
    FROM Course
    GROUP BY dept_id
    HAVING COUNT(course_id) > 2
);
SELECT * FROM Department;
SELECT * FROM Course;
