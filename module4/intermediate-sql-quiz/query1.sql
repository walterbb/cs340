-- Write the query to create the 4 tables below.

-- Create client table
CREATE TABLE client (
    id int(11) AUTO_INCREMENT,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    CONSTRAINT full_name UNIQUE (first_name, last_name),
    PRIMARY KEY (id)
);

-- Create employee table
CREATE TABLE employee (
    id int(11) AUTO_INCREMENT,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    start_date date NOT NULL,
    email varchar(255) NOT NULL,
    CONSTRAINT full_name UNIQUE (first_name, last_name),
    PRIMARY KEY (id)
);

-- Create project table
CREATE TABLE project (
    id int(11) AUTO_INCREMENT,
    title varchar(255) NOT NULL,
    comments text,
    cid int(11),
    UNIQUE (title),
    FOREIGN KEY (cid) REFERENCES client(id),
    PRIMARY KEY (id)
);

-- Create works_on table
CREATE TABLE works_on (
    pid int(11),
    eid int(11),
    due_date date NOT NULL,
    FOREIGN KEY (pid) REFERENCES project(id),
    FOREIGN KEY (eid) REFERENCES employee(id),
    PRIMARY KEY (pid, eid)
);


-- Leave the queries below untouched. These are to test your submission correctly.
-- Test that the tables were created
DESCRIBE client;
DESCRIBE employee;
DESCRIBE project;
DESCRIBE works_on;

-- Test that the correct foreign keys were created 
SELECT TABLE_NAME,COLUMN_NAME,CONSTRAint_NAME,REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE REFERENCED_TABLE_SCHEMA = 'grade';

