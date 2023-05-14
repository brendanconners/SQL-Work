#Question 1 INST327 Brendan Conners
CREATE OR REPLACE VIEW student_enrollment_details AS 
SELECT CONCAT(fname, " ", lname) AS "name", MAX(CONCAT(semester," ", year)) AS "term", COUNT(*) AS "no_of_courses_enrolled",SUM(credits) AS "credits_taken", SUM(CASE WHEN c.course_prereq IS NOT NULL THEN 1 ELSE 0 END) AS " courses_with_prerequisites"
FROM people

JOIN enrollments e USING (person_id)

JOIN course_sections cs USING (section_id)

JOIN courses c USING (course_id)

WHERE cs.meeting_days != "Online"
AND  cs.semester != "Spring"

GROUP BY  fname , lname

ORDER BY fname ASC;

SELECT * FROM student_enrollment_details;