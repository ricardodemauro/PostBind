-- Migrations.sql
-- Script for potential database migrations and updates

USE PostBin;

-- Example migration script (commented out)
/*
-- Example: Add a new column to track request size
ALTER TABLE Requests ADD COLUMN ContentSize INT NULL;

-- Example: Create a new index on the content size
CREATE INDEX IX_Requests_ContentSize ON Requests(ContentSize);

-- Example: Add trigger to calculate content size on insert
DELIMITER //
CREATE TRIGGER before_request_insert
BEFORE INSERT ON Requests
FOR EACH ROW
BEGIN
    SET NEW.ContentSize = LENGTH(NEW.Body);
END//
DELIMITER ;
*/

-- Notes: 
-- This file serves as a template for future migrations.
-- When updating the schema, add properly versioned migrations here
-- or create separate migration scripts.
-- Remember to test migrations thoroughly before applying to production.
