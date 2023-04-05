CREATE TABLE department (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  abbreviation VARCHAR(10) NOT NULL UNIQUE,
  count_employees INT CHECK(count_employees<=20)
);

CREATE TABLE employee (
  id INT PRIMARY KEY NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  middle_name VARCHAR(255),
  passport_data VARCHAR(255) UNIQUE,
  birth_date DATE CHECK (birth_date <= GETDATE()),
  birth_place VARCHAR(255),
  address VARCHAR(255),
  position VARCHAR(255),
  salary DECIMAL(10,2) CHECK (salary > 0),
  employment_date DATE,
  years_of_service INT,
  vacation_days INT 
);

CREATE TABLE head_of_department(
  department_id INT NOT NULL,
  head_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id),
  FOREIGN KEY (head_id) REFERENCES employee(id)
);

CREATE TABLE employee_position_history (
  id INT PRIMARY KEY NOT NULL,
  employee_id INT NOT NULL UNIQUE,
  position VARCHAR(255) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE vacation (
  id INT PRIMARY KEY NOT NULL,
  employee_id INT NOT NULL UNIQUE,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE department_vacation (
  department_id INT NOT NULL UNIQUE,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  employee_count INT CHECK(employee_count<=5),
  PRIMARY KEY (department_id, start_date),
  FOREIGN KEY (department_id) REFERENCES department(id)
);

INSERT INTO employee (id, last_name, first_name, middle_name, passport_data, birth_date, birth_place, address, position, salary) 
VALUES 
(1001, 'Smith', 'John', 'Peter', 'AB123456', '1990-05-01', 'New York', '123 Main St', 'Manager', 50000.00), 
(1002, 'Doe', 'Jane', 'Anne', 'CD789012', '1985-02-10', 'Los Angeles', '456 Elm St', 'HR Specialist', 35000.00), 
(1003, 'Johnson', 'Alex', 'Michael', 'EF345678', '1993-08-15', 'Chicago', '789 Oak St', 'Marketing Coordinator', 30000.00),
(1004, 'Lee', 'Jessica', 'Soo', 'GH901234', '1995-11-20', 'Seoul', '456 Main St', 'Developer', 45000.00),
(1005, 'Wang', 'Wei', 'Ling', 'IJ567890', '1991-04-30', 'Beijing', '789 Elm St', 'Designer', 40000.00),
(1006, 'Garcia', 'Maria', 'Isabel', 'KL123456', '1992-12-25', 'Madrid', '123 Oak St', 'Recruiter', 32000.00);

INSERT INTO department (id, name, abbreviation, count_employees) 
VALUES 
(1,'IT Department', 'ITD', 5), 
(2, 'HR Department', 'HRD', 9), 
(3, 'Marketing Department', 'MD', 14);

INSERT INTO head_of_department (department_id, head_id) 
VALUES 
(1,1001), 
(2, 1002), 
(3, 1003);

INSERT INTO employee_position_history(id, employee_id, position, start_date, end_date) 
VALUES 
(201, 1001, 'Manager', '2010-01-01', NULL), 
(202, 1002, 'HR Specialist', '2015-05-01', NULL), 
(203, 1003, 'Marketing Coordinator', '2018-01-01', NULL),
(204, 1004, 'Junior Developer', '2020-03-01', '2021-10-01'),
(206, 1005, 'Designer', '2019-06-01', NULL),
(207, 1006, 'Recruiter', '2017-09-01', NULL);

INSERT INTO vacation (id, employee_id, start_date, end_date)
VALUES
(1, 1001, '2023-06-01', '2023-06-10'),
(2, 1002, '2023-08-01', '2023-08-07'),
(3, 1003, '2023-07-15', '2023-07-22'),
(4, 1004, '2023-06-15', '2023-06-30'),
(5, 1005, '2023-08-15', '2023-08-25'),
(6, 1006, '2023-07-01', '2023-07-07');

SELECT * FROM department;

SELECT * FROM employee;

SELECT * FROM employee_position_history;

SELECT * FROM vacation;

SELECT * FROM head_of_department;