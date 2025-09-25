-- practice 4.2

DROP TABLE IF EXISTS StudentEnrollments;

CREATE TABLE StudentEnrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    enrollment_date DATE NOT NULL,
    CONSTRAINT uq_student_course UNIQUE (student_name, course_id)
);

INSERT INTO StudentEnrollments (student_name, course_id, enrollment_date) VALUES
('Ashish', 'CSE101', '2024-07-01'),
('Smaran', 'CSE102', '2024-07-01'),
('Vaibhav','CSE101', '2024-07-01');

START TRANSACTION;
INSERT INTO StudentEnrollments (student_name, course_id, enrollment_date)
VALUES ('Ashish', 'CSE101', '2024-07-01');
COMMIT;

START TRANSACTION;
INSERT INTO StudentEnrollments (student_name, course_id, enrollment_date)
VALUES ('Ashish', 'CSE101', '2024-07-01');
ROLLBACK;

START TRANSACTION;
SELECT * FROM StudentEnrollments
WHERE student_name = 'Ashish' AND course_id = 'CSE101'
FOR UPDATE;

START TRANSACTION;
UPDATE StudentEnrollments
SET enrollment_date = '2024-07-15'
WHERE student_name = 'Ashish' AND course_id = 'CSE101';
COMMIT;

START TRANSACTION;
SELECT * FROM StudentEnrollments
WHERE student_name = 'Ashish' AND course_id = 'CSE101'
FOR UPDATE;

UPDATE StudentEnrollments
SET enrollment_date = '2024-07-10'
WHERE student_name = 'Ashish' AND course_id = 'CSE101';
COMMIT;

START TRANSACTION;
SELECT * FROM StudentEnrollments
WHERE student_name = 'Ashish' AND course_id = 'CSE101'
FOR UPDATE;

UPDATE StudentEnrollments
SET enrollment_date = '2024-07-20'
WHERE student_name = 'Ashish' AND course_id = 'CSE101';
COMMIT;

SELECT * FROM StudentEnrollments;
