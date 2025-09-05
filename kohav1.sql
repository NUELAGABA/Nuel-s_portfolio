use project;
select * from kohav_empdata;

# Added a New Field to the Table
alter table kohav_empdata add column Bonus int after salary;
update kohav_empdata set bonus = salary * 0.1;


#SHOWING DISTINCT VALUES
SELECT DISTINCT Department 
FROM kohav_empdata;

#CREATING FUNCTION
DELIMITER //
CREATE FUNCTION EmployeeID(EmployeeID DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
RETURN EmployeeID * 12;
END //
DELIMITER ;
SHOW CREATE FUNCTION EmployeeID;

# Insert Trigger
DELIMITER //
CREATE TRIGGER Kohav_insert
BEFORE INSERT ON kohav_empdata FOR EACH ROW
BEGIN
    SET new.bonus = new.salary * 0.1;
END//
DELIMITER ;

show triggers;

#Delete Trigger
DELIMITER //
CREATE TRIGGER after_kohav_delete
AFTER DELETE ON kohav_empdata FOR EACH ROW
BEGIN
    INSERT INTO kohav_Archive (EmployeeID, Salary, deleted_at) 
    VALUES (OLD.EmployeeID, OLD.Salary, NOW());
END//
DELIMITER ;

# Update Trigger:
DELIMITER //
CREATE TRIGGER before_kohav_update
BEFORE UPDATE ON kohav_empdata FOR EACH ROW
BEGIN
    SET NEW.Salary = NOW();
END//
DELIMITER ;

#Create Stored procedures

#Insert Procedure
DELIMITER //
CREATE PROCEDURE AddEmployee(IN emp_name VARCHAR(50), IN emp_salary DECIMAL(10,2))
BEGIN
    INSERT INTO kohav_empdata (name, salary) VALUES (emp_name, emp_salary);
END//
DELIMITER ;

#Delete Procedure
DELIMITER //
CREATE PROCEDURE DeleteEmployee(IN emp_id INT)
BEGIN
    DELETE FROM kohav_empdata WHERE id = emp_id;
END//
DELIMITER ;


#Update Procedure
DELIMITER //
CREATE PROCEDURE UpdateEmployeeSalary(IN emp_id INT, IN new_salary DECIMAL(10,2))
BEGIN
    UPDATE kohav_empdata SET salary = new_salary WHERE id = emp_id;
END//
DELIMITER ;


#Changed the name of a field on my table
Alter table kohav_empdata Change column HireDate DateHire int;


#Creating a New User
create user 'nuel'@'localhost' identified by '222';

#Grant the New User SELECT, INSERT, and ALTER Privileges:
Grant SELECT, INSERT, ALTER on nuel.* to 'nuel'@'localhost';


SHOW GRANTS FOR 'nuel'@'localhost';


##Revoke All Privileges Granted to the New User:
Revoke all privileges, grant option from 'nuel'@'localhost';
FLUSH PRIVILEGES;


##Backup Statement
mysqldump -u root -p nuel > C:\Users\nuel\Desktop\mysql_backup.sql


##Restore Statement
mysql -u root -p shamzy < C:\Users\CLARA\Desktop\mysql_backup.sql




# Difference Between CHAR and VARCHAR Datatypes
# CHAR
# CHAR datatype is used when we expect the data values in a column to be of the same length.

# VARCHAR VARCHAR datatype when we expect the data values in a column to vary in length. 


#  What is the difference between SQL and MySQL?
# SQL: SQL is a programming language used to communicate with and manage databases.

# MySQL: MySQL is a Database Management System (DBMS) that uses SQL to perform database operations.


 # Why are triggers created in a database?
 # Triggers are created in a database to automate specific actions or enforce rules whenever certain events occur within the database.
 
 #  What is the difference between a Primary Key and a Foreign Key?
 # Primary Key: A primary key is a  Unique Identifier(column) in a table that uniquely identifies each record (row) in that table.
 
 # Foreign Key: A foreign key is a column (or a set of columns) in a table that creates a link between two tables. It refers to the primary key in another table.





 