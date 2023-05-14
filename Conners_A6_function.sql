#Question 2 INST327 Brendan Conners
USE ischool;

DROP FUNCTION IF EXISTS get_person_address;

DELIMITER //

CREATE FUNCTION get_person_address ( 
	fname VARCHAR(50), lname VARCHAR(50)
)
RETURNS  VARCHAR(100)
DETERMINISTIC READS SQL DATA
BEGIN 
	DECLARE address VARCHAR(100);
    SELECT CONCAT(street, ', ', city, ', ', COALESCE(state, '[Not Available]'), ', ', COALESCE(zipcode, '[Not Available]'), ', ', country) INTO address
    FROM people p
    JOIN person_addresses USING (person_id)
    JOIN addresses USING (address_id)
    WHERE fname = p.fname AND
		  lname = p.lname
    LIMIT 1;
    
    
    
    RETURN(address); 
    
END //
DELIMITER ;

 #SELECT get_person_address('Kamala','Khan');
#SELECT get_person_address('Jessica','Jones');