#Question 3 INST 327 Brendan Conners
USE ischool;


DROP TABLE IF EXISTS enrollment_records; 

CREATE TABLE enrollment_records AS
SELECT *
FROM student_enrollment_details;
ALTER TABLE enrollment_records ADD PRIMARY KEY (Name);

DROP TABLE IF EXISTS new_student_enrollment_records; 

CREATE TABLE new_student_enrollment_records(  
	new_student_Name varchar(45) NOT NULL, 
	new_student_enrollment_record_text varchar(300) DEFAULT NULL, 
	new_student_enrollment_record_timestamp datetime DEFAULT NULL, PRIMARY 
		KEY (new_student_Name)) 
ENGINE=InnoDB; 

DROP TRIGGER IF EXISTS ischool.new_student_enrollments;

DELIMITER //

CREATE TRIGGER new_student_enrollments AFTER INSERT ON enrollment_records

FOR EACH ROW 


BEGIN
	DECLARE student_name_var VARCHAR(45);
    
    DECLARE no_of_courses_enrolled INT ;
    
    DECLARE credits_taken INT;
    
    DECLARE term VARCHAR(45);
    
	SET student_name_var = NEW.Name;
    
    SET no_of_courses_enrolled = NEW.no_of_courses_enrolled;
    
    SET credits_taken = NEW.credits_taken;
    
    SET term = NEW.term;

    
	INSERT INTO new_student_enrollment_records (new_student_name, new_student_enrollment_record_text,new_student_enrollment_record_timestamp) 
    
    VALUES (NEW.Name, CONCAT("You have added a new student ", NEW.Name, " Who is registerd for ", NEW.no_of_courses_enrolled, " Courses this ", NEW.term," and will be taking ", NEW.credits_taken, " credits"),NOW());
END//

DELIMITER ;


 INSERT INTO enrollment_records VALUES ('Alex Smith', 'Fall 2022', 4, 12, 1);


SELECT * FROM new_student_enrollment_records;

