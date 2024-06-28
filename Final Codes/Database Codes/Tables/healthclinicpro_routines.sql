-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: healthclinicpro
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping events for database 'healthclinicpro'
--

--
-- Dumping routines for database 'healthclinicpro'
--
/*!50003 DROP FUNCTION IF EXISTS `countCharacters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `countCharacters`(input VARCHAR(255), characters VARCHAR(255)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE count INT DEFAULT 0;
    DECLARE i INT DEFAULT 1;

    WHILE i <= LENGTH(input) DO
        IF LOCATE(SUBSTRING(input, i, 1), characters) > 0 THEN
            SET count = count + 1;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `EmployeeExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `EmployeeExists`( 
    p_FirstName VARCHAR(50),
    p_MiddleName VARCHAR(50),
    p_LastName VARCHAR(50)
) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE employeeCount INT;

    -- Check if the employee already exists based on the combination of names
    SELECT COUNT(*) INTO employeeCount
    FROM employee
    WHERE `Employee First Name` = p_FirstName 
        AND `Employee Middle Name` = p_MiddleName 
        AND `Employee Last Name` = p_LastName;

    RETURN employeeCount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isPredictable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isPredictable`(password VARCHAR(255)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE patternLength INT DEFAULT 2;
    DECLARE i INT DEFAULT 1;

    WHILE i <= LENGTH(password) - patternLength DO
        IF SUBSTRING(password, i, patternLength) = SUBSTRING(password, i + patternLength, patternLength) THEN
            RETURN TRUE;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN FALSE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isValidPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isValidPassword`(password VARCHAR(255)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE UPPER_CASE_COUNT INT;
    DECLARE DIGIT_COUNT INT;
    DECLARE SYMBOL_COUNT INT;

    SET UPPER_CASE_COUNT = countCharacters(password, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ');
    SET DIGIT_COUNT = countCharacters(password, '0123456789');
    SET SYMBOL_COUNT = countCharacters(password, '!@#$%^&*()_+-=[]{};\\,.<>/?');

    RETURN LENGTH(password) = 8
        AND UPPER_CASE_COUNT >= 2
        AND DIGIT_COUNT >= 2
        AND SYMBOL_COUNT >= 2
        AND NOT isPredictable(password);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `LEVENSHTEIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `LEVENSHTEIN`(s1 VARCHAR(255), s2 VARCHAR(255)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE s1_len, s2_len, i, j, c, c_temp, cost INT;
    DECLARE s1_char CHAR;
    DECLARE cv0, cv1 VARBINARY(256);
    SET s1_len = CHAR_LENGTH(s1), s2_len = CHAR_LENGTH(s2), cv1 = 0x00, j = 1, i = 1, c = 0;
    IF s1 = s2 THEN
        RETURN 0;
    ELSEIF s1_len = 0 THEN
        RETURN s2_len;
    ELSEIF s2_len = 0 THEN
        RETURN s1_len;
    ELSE
        WHILE j <= s2_len DO
            SET cv1 = CONCAT(cv1, UNHEX(HEX(j))), j = j + 1;
        END WHILE;
        WHILE i <= s1_len DO
            SET s1_char = SUBSTRING(s1, i, 1), c = i, cv0 = UNHEX(HEX(i)), j = 1;
            WHILE j <= s2_len DO
                SET c = c + 1;
                IF s1_char = SUBSTRING(s2, j, 1) THEN SET cost = 0; ELSE SET cost = 1; END IF;
                SET c_temp = CONV(HEX(SUBSTRING(cv1, j, 1)), 16, 10) + cost;
                IF c > c_temp THEN SET c = c_temp; END IF;
                SET c_temp = CONV(HEX(SUBSTRING(cv1, j+1, 1)), 16, 10) + 1;
                IF c > c_temp THEN SET c = c_temp; END IF;
                SET cv0 = CONCAT(cv0, UNHEX(HEX(c))), j = j + 1;
            END WHILE;
            SET cv1 = cv0, i = i + 1;
        END WHILE;
    END IF;
    RETURN c;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `LevenshteinDistance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `LevenshteinDistance`(s1 VARCHAR(255), s2 VARCHAR(255)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE s1_len, s2_len, i, j, c, c_temp, cost INT;
    DECLARE s1_char CHAR;
DECLARE d1, d2, min_cost INT;
    SET s1_len = CHAR_LENGTH(s1);
    SET s2_len = CHAR_LENGTH(s2);

    

    IF s1_len = 0 THEN
        RETURN s2_len;
    END IF;

    IF s2_len = 0 THEN
        RETURN s1_len;
    END IF;

    SET i = 0;

    WHILE i <= s1_len DO
        SET d1 = i;
        SET j = 1;

        WHILE j <= s2_len DO
            SET s1_char = SUBSTRING(s1, i + 1, 1);
            SET cost = IF(SUBSTRING(s2, j, 1) = s1_char, 0, 1);

            SET c_temp = LEAST(d2 + 1, d1 + 1, d1 + cost);
            SET d1 = d2;
            SET d2 = c_temp;

            IF i > 0 AND j > 1 THEN
                SET min_cost = (SELECT LEAST(d2, d1, (SELECT value FROM temp_d WHERE idx = i - 1) + cost));
                UPDATE temp_d SET value = min_cost WHERE idx = i;
            END IF;

            SET j = j + 1;
        END WHILE;

        SET i = i + 1;
    END WHILE;

    RETURN d2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `LEVENSHTEIN_RATIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `LEVENSHTEIN_RATIO`(s1 VARCHAR(255), s2 VARCHAR(255)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE s1_len, s2_len, max_len INT;
    SET s1_len = LENGTH(s1), s2_len = LENGTH(s2);
    IF s1_len > s2_len THEN SET max_len = s1_len; ELSE SET max_len = s2_len; END IF;
    RETURN ROUND((1 - LEVENSHTEIN(s1, s2) / max_len) * 100);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PatientExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `PatientExists`( 
    p_FirstName VARCHAR(50),
    p_MiddleName VARCHAR(50),
    p_LastName VARCHAR(50)
) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE patientCount INT;

    -- Check if the employee already exists based on the combination of names
    SELECT COUNT(*) INTO patientCount
    FROM patients
    WHERE `Patient First Name` = p_FirstName 
        AND `Patient Middle Name` = p_MiddleName 
        AND `Patient Last Name` = p_LastName;

    RETURN patientCount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SHA256_HASH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SHA256_HASH`(input_string VARCHAR(255)) RETURNS varchar(64) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE hash_result VARCHAR(64);
    SET hash_result = SHA2(input_string, 256);
    RETURN hash_result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addMedicalReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addMedicalReport`(
    IN `Patients First Name` VARCHAR(50),
    IN `Patients Middle Name` VARCHAR(50),
    IN `Patients Last Name` VARCHAR(50),
    IN MedicalReport longtext, 
    IN Treatment longtext
)
BEGIN
    DECLARE patientId INT;

    -- Check if the patient exists
    SELECT id INTO patientId
    FROM patients
    WHERE `Patient First Name` = `Patients First Name` 
        AND `Patient Middle Name` = `Patients Middle Name` 
        AND `Patients Last Name` = `Patients Last Name`;
    IF patientId IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Patient does not exist';
    ELSE
        INSERT INTO medicalreport (`Medical Report`, Treatment, PatientId)
        VALUES (MedicalReport, Treatment, patientId);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculate_levenshtein_distance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculate_levenshtein_distance`(
	IN s1 VARCHAR(255), 
	IN s2 VARCHAR(255), 
	OUT result INT
)
BEGIN
DECLARE s1_len, s2_len, i, j, c, c_temp, cost, result INT;
DECLARE s1_char CHAR;

-- Temporary table to store distances
CREATE TEMPORARY TABLE IF NOT EXISTS distances (i INT, j INT, distance INT);

SET s1_len = CHAR_LENGTH(s1);
SET s2_len = CHAR_LENGTH(s2);

-- Initialize the distances table
TRUNCATE TABLE distances;
INSERT INTO distances (i, j, distance) VALUES (0, 0, 0);

-- Initialize the first row
SET j = 1;
WHILE j <= s2_len DO
    INSERT INTO distances (i, j, distance) VALUES (0, j, j);
    SET j = j + 1;
END WHILE;

-- Main dynamic programming loop
SET i = 1;
WHILE i <= s1_len DO
    SET s1_char = SUBSTRING(s1, i, 1);

    -- Initialize the first column of the current row
    INSERT INTO distances (i, j, distance) VALUES (i, 0, i);

    SET j = 1;
    WHILE j <= s2_len DO
        SET cost = IF(s1_char = SUBSTRING(s2, j, 1), 0, 1);

        -- Calculate the minimum distance
        SELECT MIN(distance + cost) INTO c
        FROM distances
        WHERE i = i - 1 AND j = j - 1;
        
        SELECT MIN(distance + 1) INTO c_temp
        FROM distances
        WHERE i = i AND j = j - 1;
        
        IF c_temp < c THEN
            SET c = c_temp;
        END IF;

        SELECT MIN(distance + 1) INTO c_temp
        FROM distances
        WHERE i = i - 1 AND j = j;
        
        IF c_temp < c THEN
            SET c = c_temp;
        END IF;

        -- Update the current cell with the minimum distance
        INSERT INTO distances (i, j, distance) VALUES (i, j, c);

        SET j = j + 1;
    END WHILE;

    SET i = i + 1;
END WHILE;

-- Retrieve the final Levenshtein distance
SELECT distance INTO result
FROM distances
WHERE i = s1_len AND j = s2_len;

-- Set the result variable
SET @result = result;

-- Drop the temporary table
DROP TEMPORARY TABLE IF EXISTS distances;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatePatientUserAndStoreSecret` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreatePatientUserAndStoreSecret`(
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_patientID INT,
    IN p_generatedSalt VARCHAR(256)
)
BEGIN
    DECLARE generatedSalt VARCHAR(255);
    DECLARE hashedPassword VARCHAR(255);
    DECLARE userFirstName VARCHAR(255);
    DECLARE userMiddleName VARCHAR(255);
    DECLARE userLastName VARCHAR(255);
    DECLARE passwordSimilarityFirstName INT;
    DECLARE passwordSimilarityMiddleName INT;
    DECLARE passwordSimilarityLastName INT;
	DECLARE patientCount INT;
	-- Retrieve user details
		SELECT 
			`Patient First Name`, 
			`Patient Middle Name`, 
			`Patient Last Name`
		INTO 
			userFirstName, 
			userMiddleName, 
			userLastName
		FROM 
			patients
		WHERE 
			ID = p_patientID;
    -- Check if the employee already exists based on the combination of names
    SET patientCount = PatientExists(userFirstName, userMiddleName, userLastName);

    -- If the combination exists, raise an exception
    IF patientCount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Employee with2222 the same name combination already exists';
    ELSE
		
		IF NOT isValidPassword(p_password) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Password does not meet the required criteria';
		END IF;
		-- Check if the username is equal to the user's names
		IF 
			LOCATE(UPPER(p_username), UPPER(userFirstName)) > 0 OR
			LOCATE(UPPER(p_username), UPPER(userMiddleName)) > 0 OR
			LOCATE(UPPER(p_username), UPPER(userLastName)) > 0
		THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Username cannot be the same as the user''s first name, middle name, or last name';
		END IF;
		-- Check the similarity between the password and the user's names
		SET passwordSimilarityFirstName = LEVENSHTEIN_RATIO(p_password, userFirstName);
		SET passwordSimilarityMiddleName = LEVENSHTEIN_RATIO(p_password, userMiddleName);
		SET passwordSimilarityLastName = LEVENSHTEIN_RATIO(p_password, userLastName);

		-- Check if the password is too similar to the user's names
		IF 
			passwordSimilarityFirstName >= 40 OR
			passwordSimilarityMiddleName >= 40 OR
			passwordSimilarityLastName >= 40
		THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Password is too similar to the user''s first name, middle name, or last name';
		END IF;

		-- Continue with the rest of the procedure

		-- Generate a random salt
		SET generatedSalt = p_generatedSalt;

		-- Concatenate password and salt, then hash the salted password
		SET hashedPassword = SHA2(CONCAT(p_password, generatedSalt), 256);

		-- Insert into employeelogin table
		INSERT INTO patientlogin (Username, Password, PatientID) VALUES (p_username, hashedPassword, p_patientID);

		-- Call the procedure to encrypt and store the secret
		CALL EncryptAndStoreSecret(generatedSalt, p_username);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatePatientUsernameAndStoreSecret` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreatePatientUsernameAndStoreSecret`(
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_patientId INT,
    IN p_generatedSalt VARCHAR(256)
)
BEGIN
    DECLARE generatedSalt VARCHAR(255);
    DECLARE hashedPassword VARCHAR(255);
    DECLARE userFirstName VARCHAR(255);
    DECLARE userMiddleName VARCHAR(255);
    DECLARE userLastName VARCHAR(255);
    DECLARE passwordSimilarityFirstName INT;
    DECLARE passwordSimilarityMiddleName INT;
    DECLARE passwordSimilarityLastName INT;
	DECLARE patientCount INT;

		SELECT 
			`Patient First Name`, 
			`Patient Middle Name`, 
			`Patient Last Name`
		INTO 
			userFirstName, 
			userMiddleName, 
			userLastName
		FROM 
			patients
		WHERE 
			ID = p_patientId;
    -- Check if the employee already exists based on the combination of names
    SET patientCount = PatientExists(userFirstName, userMiddleName, userLastName);

    -- If the combination exists, raise an exception
    IF patientCount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Employee with2222 the same name combination already exists';
    ELSE
		
		IF NOT isValidPassword(p_password) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Password does not meet the required criteria';
		END IF;
		-- Check if the username is equal to the user's names
		IF 
			LOCATE(UPPER(p_username), UPPER(userFirstName)) > 0 OR
			LOCATE(UPPER(p_username), UPPER(userMiddleName)) > 0 OR
			LOCATE(UPPER(p_username), UPPER(userLastName)) > 0
		THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Username cannot be the same as the user''s first name, middle name, or last name';
		END IF;
		-- Check the similarity between the password and the user's names
		SET passwordSimilarityFirstName = LEVENSHTEIN_RATIO(p_password, userFirstName);
		SET passwordSimilarityMiddleName = LEVENSHTEIN_RATIO(p_password, userMiddleName);
		SET passwordSimilarityLastName = LEVENSHTEIN_RATIO(p_password, userLastName);

		-- Check if the password is too similar to the user's names
		IF 
			passwordSimilarityFirstName >= 40 OR
			passwordSimilarityMiddleName >= 40 OR
			passwordSimilarityLastName >= 40
		THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Password is too similar to the user''s first name, middle name, or last name';
		END IF;

		-- Continue with the rest of the procedure

		-- Generate a random salt
		SET generatedSalt = p_generatedSalt;

		-- Concatenate password and salt, then hash the salted password
		SET hashedPassword = SHA2(CONCAT(p_password, generatedSalt), 256);

		-- Insert into employeelogin table
		INSERT INTO patientlogin (Username, Password, PatientID) VALUES (p_username, hashedPassword, p_patientId);

		-- Call the procedure to encrypt and store the secret
		CALL EncryptAndStoreSecret(generatedSalt, p_username);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateUserAndStoreSecret` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateUserAndStoreSecret`(
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_employeeId INT,
    IN p_generatedSalt VARCHAR(256)
)
BEGIN
    DECLARE generatedSalt VARCHAR(255);
    DECLARE hashedPassword VARCHAR(255);
    DECLARE userFirstName VARCHAR(255);
    DECLARE userMiddleName VARCHAR(255);
    DECLARE userLastName VARCHAR(255);
    DECLARE passwordSimilarityFirstName INT;
    DECLARE passwordSimilarityMiddleName INT;
    DECLARE passwordSimilarityLastName INT;
	DECLARE employeeCount INT;
	-- Retrieve user details
		SELECT 
			`Employee First Name`, 
			`Employee Middle Name`, 
			`Employee Last Name`
		INTO 
			userFirstName, 
			userMiddleName, 
			userLastName
		FROM 
			employee
		WHERE 
			ID = p_employeeId;
    -- Check if the employee already exists based on the combination of names
    SET employeeCount = EmployeeExists(userFirstName, userMiddleName, userLastName);

    -- If the combination exists, raise an exception
    IF employeeCount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Employee with2222 the same name combination already exists';
    ELSE
		
		IF NOT isValidPassword(p_password) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Password does not meet the required criteria';
		END IF;
		-- Check if the username is equal to the user's names
		IF 
			LOCATE(UPPER(p_username), UPPER(userFirstName)) > 0 OR
			LOCATE(UPPER(p_username), UPPER(userMiddleName)) > 0 OR
			LOCATE(UPPER(p_username), UPPER(userLastName)) > 0
		THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Username cannot be the same as the user''s first name, middle name, or last name';
		END IF;
		-- Check the similarity between the password and the user's names
		SET passwordSimilarityFirstName = LEVENSHTEIN_RATIO(p_password, userFirstName);
		SET passwordSimilarityMiddleName = LEVENSHTEIN_RATIO(p_password, userMiddleName);
		SET passwordSimilarityLastName = LEVENSHTEIN_RATIO(p_password, userLastName);

		-- Check if the password is too similar to the user's names
		IF 
			passwordSimilarityFirstName >= 40 OR
			passwordSimilarityMiddleName >= 40 OR
			passwordSimilarityLastName >= 40
		THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Password is too similar to the user''s first name, middle name, or last name';
		END IF;

		-- Continue with the rest of the procedure

		-- Generate a random salt
		SET generatedSalt = p_generatedSalt;

		-- Concatenate password and salt, then hash the salted password
		SET hashedPassword = SHA2(CONCAT(p_password, generatedSalt), 256);

		-- Insert into employeelogin table
		INSERT INTO employeelogin (Username, Password, EmployeeId) VALUES (p_username, hashedPassword, p_employeeId);

		-- Call the procedure to encrypt and store the secret
		CALL EncryptAndStoreSecret(generatedSalt, p_username);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DecryptSecret` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DecryptSecret`(
    IN p_Username VARCHAR(45),
    OUT p_decryptedSaltSecretKey VARCHAR(256)
)
BEGIN
    DECLARE v_encryption_key VARCHAR(256);
    DECLARE v_encryptedSaltSecretKey VARBINARY(256);

    -- Retrieve the encryption key for the given username
    SELECT `key` INTO v_encryptedSaltSecretKey
    FROM external.sky
    WHERE username = p_Username
    LIMIT 1;

    -- Check if the username exists
    IF v_encryptedSaltSecretKey IS NOT NULL THEN
        -- Retrieve the encryption key from keydatabase
        SELECT `keys` INTO v_encryption_key 
        FROM keydatabase.keys
        WHERE application = 'HealthClincPro'
        LIMIT 1;

        -- Decrypt the secret using the retrieved encryption key
        SET p_decryptedSaltSecretKey = CAST(AES_DECRYPT(v_encryptedSaltSecretKey, v_encryption_key) AS CHAR);
    ELSE
        -- Handle the case where the username does not exist
        SET p_decryptedSaltSecretKey = NULL;
    END IF;
    -- SET @message_text = CONCAT('The value is: ', saltSecretKey);
	-- SIGNAL SQLSTATE '45000'
	-- SET MESSAGE_TEXT = @message_text;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EmployeeLoginChecker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EmployeeLoginChecker`(
    IN p_Username VARCHAR(45),
    IN p_Password VARCHAR(256),
    OUT p_Result VARCHAR(50),
    OUT p_Role VARCHAR(10)
)
BEGIN
    DECLARE v_StoredPassword VARCHAR(256);
    DECLARE v_DecryptedSalt VARCHAR(256);
    DECLARE v_HashedPassword VARCHAR(256);
    DECLARE v_UserRole VARCHAR(50); -- Declare a local variable

    -- Retrieve stored password
    CALL GetStoredPassword(p_Username, @v_StoredPassword);
    SET v_StoredPassword = @v_StoredPassword;

    IF v_StoredPassword IS NOT NULL THEN

        CALL DecryptSecret(p_Username, @v_DecryptedSalt);
        SET v_DecryptedSalt = @v_DecryptedSalt;


        
        SET v_HashedPassword = SHA256_HASH(CONCAT(p_Password, v_DecryptedSalt));
        IF v_StoredPassword = v_HashedPassword THEN
  
            CALL GetEmployeeRole(p_Username, v_UserRole);
            SET p_Role = v_UserRole;
            SET p_Result = 'SUCCESS';
        ELSE
            SET p_Result = 'In33valid username or password';
        END IF;
    ELSE
        SET p_Result = 'Invalid username or password';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EncryptAndStoreSecret` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EncryptAndStoreSecret`(
    IN saltSecretKey VARCHAR(256),
    IN uName VARCHAR(45)
)
BEGIN
	DECLARE encryption_key VARCHAR(256);
    DECLARE encryptedSaltSecretKey VARBINARY(256); 
    
   

	select keydatabase.`keys`.`keys` into encryption_key 
    from keydatabase.keys where application = 'HealthClincPro'
    Limit 1;
    
    
    SET encryptedSaltSecretKey =  AES_ENCRYPT(saltSecretKey, encryption_key);

    -- Store the generated encryption key in the external skey table
    INSERT INTO external.sky (`key`, Username) VALUES (encryptedSaltSecretKey, uName);   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EnterMedicalReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EnterMedicalReport`(	
    IN p_patientUsername VARCHAR(45),
    IN p_doctorUsername VARCHAR(45),
    IN p_medicalReport LONGTEXT,
    IN p_treatment LONGTEXT
)
BEGIN
	DECLARE result VARCHAR(50); 
	
	SELECT employee.ROLE INTO result
	FROM employeelogin
	JOIN employee ON employeelogin.employeeId = employee.ID
	WHERE employeelogin.Username = p_doctorUsername;
	IF result = 'Doctor' THEN
    -- Insert into medicalreport table if the role is 'Doctor'
    INSERT INTO healthclinicpro.medicalreport 
        (`Medical Report`, Treatment, `Patient Username`, `Doctor Username`)
    VALUES 
        (
            p_medicalReport,
            p_treatment,
            p_patientUsername,
            p_doctorUsername
        );
	ELSE
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'Invalid role. Only Doctors are allowed to perform this action.';
	END IF;

   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_session_token` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_session_token`(
    IN p_username VARCHAR(255),
    IN p_token_key VARCHAR(255),
    OUT p_session_token VARCHAR(255), -- OUT parameter to return the session token
    OUT p_user_role VARCHAR(255) -- OUT parameter to return the user role
)
BEGIN
    DECLARE p_expiration_timestamp TIMESTAMP;

    -- Generate a unique session token
    SET p_session_token = SHA2(CONCAT(p_username, p_token_key, NOW()), 256);

    -- Set the expiration timestamp (e.g., 1 hour from now)
    SET p_expiration_timestamp = NOW() + INTERVAL 1 HOUR;

    -- Retrieve the user role using the GetEmployeeRole procedure
    CALL GetEmployeeRole(p_username, p_user_role);

    -- Insert the session token into the session_tokens table with the retrieved user role
    INSERT INTO session_tokens (username, token, expiration_timestamp, role)
    VALUES (p_username, p_session_token, p_expiration_timestamp, p_user_role);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEmployeeRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEmployeeRole`(
    IN p_Username VARCHAR(45),
    OUT p_Role VARCHAR(50)
)
BEGIN
    DECLARE v_employee_id INT;


    SELECT employeeId INTO v_employee_id
    FROM employeelogin
    WHERE username = p_Username
    LIMIT 1;


    IF v_employee_id IS NOT NULL THEN
        SELECT Role INTO p_Role
        FROM employee
        WHERE id = v_employee_id
        LIMIT 1;
    ELSE
        SET p_Role = NULL; -- or any default value indicating that the user doesn't exist
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEmployeeStoredPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEmployeeStoredPassword`(
    IN p_Username VARCHAR(45),
    OUT p_Password VARCHAR(256)
)
BEGIN
    DECLARE v_RowCount INT;

    -- Check if the username exists
    SELECT COUNT(*) INTO v_RowCount
    FROM employeelogin
    WHERE Username = p_Username;

    -- If the username exists, retrieve the password
    IF v_RowCount > 0 THEN
        SELECT Password INTO p_Password
        FROM employeelogin
        WHERE Username = p_Username
        LIMIT 1;
    ELSE
        -- If the username does not exist, set the password to NULL 
        SET p_Password = NULL;  
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPatientStoredPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPatientStoredPassword`(
    IN p_Username VARCHAR(45),
    OUT p_Password VARCHAR(256)
)
BEGIN
    DECLARE v_RowCount INT;

    -- Check if the username exists
    SELECT COUNT(*) INTO v_RowCount
    FROM patientlogin
    WHERE Username = p_Username;

    -- If the username exists, retrieve the password
    IF v_RowCount > 0 THEN
        SELECT Password INTO p_Password
        FROM patientlogin
        WHERE Username = p_Username
        LIMIT 1;
    ELSE
        -- If the username does not exist, set the password to NULL 
        SET p_Password = NULL;  
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStoredPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStoredPassword`(
    IN p_Username VARCHAR(45),
    OUT p_Password VARCHAR(256)
)
BEGIN
    DECLARE v_RowCount INT;

    -- Check if the username exists
    SELECT COUNT(*) INTO v_RowCount
    FROM employeelogin
    WHERE BINARY Username = BINARY p_Username;

    -- If the username exists, retrieve the password
    IF v_RowCount > 0 THEN
        SELECT Password INTO p_Password
        FROM employeelogin
		WHERE BINARY Username = BINARY p_Username
        LIMIT 1;
    ELSE
        -- If the username does not exist, set the password to NULL 
        SET p_Password = NULL;  
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoginChecker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LoginChecker`(
    IN p_Username VARCHAR(45),
    IN p_Password VARCHAR(256),
    OUT p_Result VARCHAR(50),
    OUT p_Role VARCHAR(10)
)
BEGIN
    DECLARE v_StoredPassword VARCHAR(256);
    DECLARE v_DecryptedSalt VARCHAR(256);
    DECLARE v_HashedPassword VARCHAR(256);
    DECLARE v_UserRole VARCHAR(50); -- Declare a local variable

    -- Retrieve stored password
    CALL GetStoredPassword(p_Username, @v_StoredPassword);
    SET v_StoredPassword = @v_StoredPassword;

    -- Check if password is retrieved successfully
    IF v_StoredPassword IS NOT NULL THEN
        -- Decrypt the salt
        CALL DecryptSecret(p_Username, @v_DecryptedSalt);
        SET v_DecryptedSalt = @v_DecryptedSalt;
		
        -- Hash the provided password with the decrypted salt
		SET v_HashedPassword = SHA256_HASH(CONCAT(p_Password, v_DecryptedSalt));
        IF v_StoredPassword = v_HashedPassword THEN
            CALL GetEmployeeRole(p_Username, v_UserRole);
            SET p_Role= v_UserRole;
            SET p_Result= 'SUCCESS';

        ELSE
            SET p_Result = 'Invalid username or password';
        END IF;
    ELSE
        SET p_Result = 'Invalid usernaaaaaaaaaame or password';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PatientLoginChecker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PatientLoginChecker`(
    IN p_Username VARCHAR(45),
    IN p_Password VARCHAR(256),
    OUT p_Result VARCHAR(50),
    OUT p_Role VARCHAR(10)
)
BEGIN
    DECLARE v_StoredPassword VARCHAR(256);
    DECLARE v_DecryptedSalt VARCHAR(256);
    DECLARE v_HashedPassword VARCHAR(256);
    

    -- Retrieve stored password
    CALL GetPatientStoredPassword(p_Username, @v_StoredPassword);
    SET v_StoredPassword = @v_StoredPassword;

    -- Check if password is retrieved successfully
    IF v_StoredPassword IS NOT NULL THEN
        -- Decrypt the salt
        CALL DecryptSecret(p_Username, @v_DecryptedSalt);
        SET v_DecryptedSalt = @v_DecryptedSalt;
		
        -- Hash the provided password with the decrypted salt
		SET v_HashedPassword = SHA256_HASH(CONCAT(p_Password, v_DecryptedSalt));
        IF v_StoredPassword = v_HashedPassword THEN
            SET p_Role= 'Patient';
            SET p_Result= 'SUCCESS';

        ELSE
            SET p_Result = 'Invalid username or password';
        END IF;
    ELSE
        SET p_Result = 'Invalid usernaaaaaaaaaame or password';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterEmployee`(
    IN p_FirstName VARCHAR(50),
    IN p_MiddleName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_Age INT,
    IN p_Gender ENUM('female', 'male'),
    IN p_Role VARCHAR(50),
    OUT p_Id INT
)
BEGIN
   DECLARE employeeCount INT;

    -- Check if the employee already exists based on the combination of names
    SET employeeCount = EmployeeExists(p_FirstName, p_MiddleName, p_LastName);

    -- If the combination exists, raise an exception
    IF employeeCount > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Employee with the same name combination already exists';
    ELSE
        -- If the combination does not exist, proceed with the insertion
        INSERT INTO employee (`Employee First Name`, `Employee Middle Name`, `Employee Last Name`, Age, Gender, Role)
        VALUES (p_FirstName, p_MiddleName, p_LastName, p_Age, p_Gender, p_Role);

        -- Get the ID of the newly inserted employee
        SET p_Id = LAST_INSERT_ID();
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterPatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterPatient`(
    IN p_FirstName VARCHAR(50),
    IN p_MiddleName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_Age INT,
    IN p_Gender ENUM('female', 'male'),
    IN p_phonenumber VARCHAR(10),
    OUT p_paitentID INT
)
BEGIN
    DECLARE patientCount INT;

    -- Check if the employee already exists based on the combination of names
    SELECT COUNT(*) INTO patientCount
    FROM patients
    WHERE `Patient First Name` = p_FirstName 
        AND `Patient Middle Name` = p_MiddleName 
        AND `Patient Last Name` = p_LastName;

    -- If the combination exists, raise an exception
    IF patientCount > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Employee with the same name  already exists';
    ELSE
        -- If the combination does not exist, proceed with the insertion
        INSERT INTO patients (`Patient First Name`, `Patient Middle Name`, `Patient Last Name`, Age, Gender, `Phone Number`)
        VALUES (p_FirstName, p_MiddleName, p_LastName, p_Age, p_Gender,p_phonenumber);
        
		SET p_paitentID = LAST_INSERT_ID();
        -- Get the ID of the newly inserted employee
        -- SET p_Id = LAST_INSERT_ID();
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterPhoneNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterPhoneNumber`(
    IN p_PhoneNumber VARCHAR(20),
    IN p_EmployeeId INT
)
BEGIN


		INSERT INTO employeephonenumber (`Employee Phone Number`, employeeId)
		VALUES (p_PhoneNumber, p_EmployeeId);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `viewEmployeeInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `viewEmployeeInfo`(	
	IN p_Username varchar(50),
    OUT p_employeeFirstName  varchar(50),
	OUT p_employeeMiddleName  varchar(50),
	OUT p_employeeLastName varchar(50),
    OUT p_Age INT,
    OUT p_Gender ENUM('female', 'male'),
    OUT p_phoneNumber varchar(50),
    OUT p_Role  varchar(50)
)
BEGIN
		DECLARE employeeCount INT;
		DECLARE v_employeeId INT;
		DECLARE v_EmployeeFirstName varchar(50);
        DECLARE v_EmployeeMiddleName varchar(50);
        DECLARE v_EmployeeLastName varchar(50);
        DECLARE v_Age INT;
        DECLARE v_Gender ENUM('female', 'male');
        DECLARE v_Role varchar(50);
		DECLARE v_phonNumber varchar(50);
		declare Count int;
       
    -- Check if the employee already exists based on the combination of names
    SELECT COUNT(*) INTO Count
    FROM employeelogin
    WHERE username = p_Username
    LIMIT 1;
   
    -- If the combination exists, raise an exception
    IF Count < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Employee with the same name combination already exists';
    ELSE
		SELECT
			employee.ID, employee.`Employee First Name`, employee.`Employee Middle Name`, employee.`Employee Last Name`,
			employee.Age, employee.Gender, employee.Role
		INTO
			v_employeeId, v_EmployeeFirstName, v_EmployeeMiddleName, v_EmployeeLastName,
			v_Age, v_Gender, v_Role
		FROM
			employeelogin 
		JOIN
			employee  ON employeelogin.employeeId = employee.ID
		WHERE
			employeelogin.username = p_Username
		ORDER BY
			employee.id
			LIMIT 1;

        SELECT GROUP_CONCAT(`Employee Phone Number`) 
        INTO p_phoneNumber
        FROM healthclinicpro.employeephonenumber
        WHERE employeeId = v_employeeId;
        
        SET p_employeeFirstName= v_EmployeeFirstName;
        SET p_employeeMiddleName = v_EmployeeMiddleName;
        SET p_employeeLastName = v_EmployeeLastName;
        SET p_Age = v_Age;
        SET p_Gender = v_Gender;
        SET p_Role = v_Role;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `viewMedicalReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `viewMedicalReport`(
    IN p_patientUsername VARCHAR(45),
    OUT p_medicalReportsConcatenated LONGTEXT,
    OUT p_doctorNamesConcatenated LONGTEXT
)
BEGIN

    DECLARE done INT DEFAULT FALSE;
    DECLARE p_medicalReport LONGTEXT; 
    DECLARE p_treatment LONGTEXT;      
    DECLARE p_doctorUsername VARCHAR(45); 
    DECLARE p_doctorName VARCHAR(150); 
    
    DECLARE cur_medical CURSOR FOR
		SELECT `Medical Report`, Treatment, `Doctor Username`
		FROM healthclinicpro.medicalreport
		WHERE `Patient Username` = p_patientUsername;

    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

   
    SET p_medicalReportsConcatenated = '';
    SET p_doctorNamesConcatenated = '';


    OPEN cur_medical;


    medical_loop: LOOP
        
        FETCH cur_medical INTO p_medicalReport, p_treatment, p_doctorUsername;

      
        IF done THEN
            LEAVE medical_loop;
        END IF;


        SELECT CONCAT_WS(' ', `Employee First Name`, `Employee Middle Name`, `Employee Last Name`)
        INTO p_doctorName
        FROM healthclinicpro.employee
        JOIN healthclinicpro.employeelogin ON employee.ID = employeelogin.employeeId
        WHERE employeelogin.Username = p_doctorUsername;

        SET p_medicalReportsConcatenated = CONCAT_WS(p_medicalReportsConcatenated, 
            '\nMedical Report: ', p_medicalReport, '\nTreatment: ', p_treatment);

        SET p_doctorNamesConcatenated = CONCAT_WS(p_doctorNamesConcatenated, 
            '\nDoctor Name: ', p_doctorName, '\n');
    END LOOP;

    CLOSE cur_medical;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `viewPatientInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `viewPatientInfo`(	
	IN p_Username varchar(50),
    OUT patientFirstName  varchar(50),
	OUT patientMiddleName  varchar(50),
	OUT patientLastName varchar(50),
    OUT Age INT,
    OUT Gender ENUM('female', 'male'),
    OUT phonenumber  varchar(10)
)
BEGIN
		DECLARE v_patientFirstName varchar(50);
        DECLARE v_patientMiddleName varchar(50);
        DECLARE v_patientLastName varchar(50);
        DECLARE v_Age INT;
        DECLARE v_Gender ENUM('female', 'male');
        DECLARE v_phonenumber varchar(10);
		DECLARE Count int;
       
    SELECT COUNT(*) INTO Count
    FROM patientlogin
    WHERE Username = p_Username
    LIMIT 1;
   

    IF Count < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Employee with the same name combination already exists';
    ELSE
		SELECT
			patients.`Patient First Name`, patients.`Patient Middle Name`, patients.`Patient Last Name`,
			patients.Age, patients.Gender, patients.`Phone Number`
		INTO
			v_patientFirstName, v_patientMiddleName, v_patientLastName,
			v_Age, v_Gender, v_phonenumber
		FROM
			patientlogin 
		JOIN
			patients  ON patientlogin.PatientID = patients.id
		WHERE
			patientlogin.Username = p_Username
		ORDER BY
			patients.id
			LIMIT 1;

        SET patientFirstName= v_patientFirstName;
        SET patientMiddleName =  v_patientMiddleName;
        SET patientLastName = v_patientLastName;
        SET Age = v_Age;
        SET Gender = v_Gender;
        SET phonenumber = v_phonenumber;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-05 20:52:35
