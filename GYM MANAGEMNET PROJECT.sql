-- Gym Management System SQL Script

-- Database Creation
CREATE DATABASE gym;
USE gym;

-- 1. Accounts Table
CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(100),
    role ENUM('member', 'admin')
);

-- 2. Members Table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    phone VARCHAR(15),
    email VARCHAR(100),
    join_date DATE,
    account_id INT,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- 3. Plans Table
CREATE TABLE plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(50),
    duration_months INT,
    cost DECIMAL(10,2)
);

-- 4. Subscriptions Table
CREATE TABLE subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    plan_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
);

-- 5. Payments Table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id)
);

-- 6. Trainers Table
CREATE TABLE trainers (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(15)
);

-- 7. Trainer Assignments Table
CREATE TABLE trainer_assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    trainer_id INT,
    assigned_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id)
);

-- Insert Data

-- Accounts (usernames/passwords reflect member names)
INSERT INTO accounts (username, password, role) VALUES
('aryan', 'aryan@123', 'member'),
('sanya', 'sanya@123', 'member'),
('aniket', 'aniket@123', 'member'),
('kavya', 'kavya@123', 'member'),
('siddharth', 'sid@123', 'member'),
('tanya', 'tanya@123', 'member'),
('rohan', 'rohan@123', 'member'),
('diya', 'diya@123', 'member'),
('vivaan', 'vivaan@123', 'member'),
('ritika', 'ritika@123', 'member'),
('admin_raj', 'adminraj@123', 'admin'),
('admin_kiran', 'adminkiran@123', 'admin');


-- Members
INSERT INTO members (name, age, gender, phone, email, join_date, account_id) VALUES
('Aryan', 42, 'Male', '9790920784', 'aryan1@gmail.com', '2024-12-17', 1),
('Sanya', 18, 'Female', '9377314474', 'sanya2@gmail.com', '2024-12-20', 2),
('Aniket', 41, 'Male', '9988147174', 'aniket3@gmail.com', '2024-12-11', 3),
('Kavya', 28, 'Female', '9468663858', 'kavya4@gmail.com', '2024-12-09', 4),
('Siddharth', 25, 'Male', '9899232721', 'siddharth5@gmail.com', '2024-12-06', 5),
('Tanya', 29, 'Female', '9317018766', 'tanya6@gmail.com', '2024-12-04', 6),
('Rohan', 35, 'Male', '9648005954', 'rohan7@gmail.com', '2024-12-24', 7),
('Diya', 38, 'Female', '9094960296', 'diya8@gmail.com', '2024-12-26', 8),
('Vivaan', 22, 'Male', '9887188378', 'vivaan9@gmail.com', '2024-12-02', 9),
('Ritika', 24, 'Female', '9755760035', 'ritika10@gmail.com', '2024-12-28', 10);

-- Plans
INSERT INTO plans (plan_name, duration_months, cost) VALUES
('Basic', 1, 999.00),
('Standard', 3, 2599.00),
('Premium', 6, 4999.00);

-- Subscriptions
INSERT INTO subscriptions (member_id, plan_id, start_date, end_date) VALUES
(1, 3, '2025-01-12', '2025-07-12'),
(2, 1, '2025-01-08', '2025-02-08'),
(3, 2, '2025-01-09', '2025-04-09'),
(4, 2, '2025-01-12', '2025-04-12'),
(5, 2, '2025-01-05', '2025-04-05'),
(6, 2, '2025-01-12', '2025-04-12'),
(7, 2, '2025-01-16', '2025-04-16'),
(8, 1, '2025-01-19', '2025-02-19'),
(9, 1, '2025-01-18', '2025-02-18'),
(10, 2, '2025-01-13', '2025-04-13');

-- Payments
INSERT INTO payments (subscription_id, amount, payment_date) VALUES
(1, 999.00, '2025-01-22'),
(2, 999.00, '2025-01-06'),
(3, 999.00, '2025-01-14'),
(4, 999.00, '2025-01-03'),
(5, 999.00, '2025-01-11'),
(6, 999.00, '2025-01-01'),
(7, 2599.00, '2025-01-17'),
(8, 2599.00, '2025-01-02'),
(9, 999.00, '2025-01-02'),
(10, 999.00, '2025-01-26');

-- Trainers
INSERT INTO trainers (name, specialization, phone) VALUES
('Raj', 'Yoga', '8869372279'),
('Vikram', 'Cardio', '8633696586'),
('Amit', 'Strength', '8490271176'),
('Sunil', 'Zumba', '8493113476'),
('Deepak', 'CrossFit', '8494136296');

-- Trainer Assignments
INSERT INTO trainer_assignments (member_id, trainer_id, assigned_date) VALUES
(1, 1, '2025-01-11'),
(3, 4, '2025-01-04'),
(5, 1, '2025-01-18'),
(7, 5, '2025-01-03'),
(9, 3, '2025-01-15');

-- 1. Show all accounts
SELECT * FROM accounts;

-- 2. Show all members
SELECT * FROM members;

-- 3. Show all plans
SELECT * FROM plans;

-- 4. Show all subscriptions
SELECT * FROM subscriptions;

-- 5. Show all payments
SELECT * FROM payments;

-- 6. Show all trainers
SELECT * FROM trainers;

-- 7. Show all trainer assignments
SELECT * FROM trainer_assignments;






-- 🔍 15 Important Queries

-- 1. Members with their subscription plans
SELECT m.name, p.plan_name
FROM members m
JOIN subscriptions s ON m.member_id = s.member_id
JOIN plans p ON s.plan_id = p.plan_id;

-- 2. Total revenue
SELECT SUM(amount) AS Total_Revenue FROM payments;

-- 3. Members on Premium plan
SELECT m.name FROM members m
JOIN subscriptions s ON m.member_id = s.member_id
JOIN plans p ON s.plan_id = p.plan_id
WHERE p.plan_name = 'Premium';

-- 4. Trainer assigned to members
SELECT m.name AS Member, t.name AS Trainer
FROM trainer_assignments ta
JOIN members m ON ta.member_id = m.member_id
JOIN trainers t ON ta.trainer_id = t.trainer_id;

-- 5. Members who joined between 2024-12-26 and 2025-01-10
SELECT name, join_date 
FROM members 
WHERE join_date BETWEEN '2024-12-26' AND '2025-01-10';



-- 6. Members count by gender
SELECT gender, COUNT(*) AS total FROM members GROUP BY gender;

-- 7. Most expensive plan
SELECT * FROM plans ORDER BY cost DESC LIMIT 1;

-- 8. Subscriptions expiring this month
SELECT m.name, s.end_date FROM subscriptions s
JOIN members m ON s.member_id = m.member_id
WHERE MONTH(s.end_date) = MONTH(CURDATE()) AND YEAR(s.end_date) = YEAR(CURDATE());

-- 9. Account details with role
SELECT m.name, a.username, a.role 
FROM members m
JOIN accounts a ON m.account_id = a.account_id;

-- 10. Total payments per member
SELECT m.name, SUM(p.amount) AS Total_Paid
FROM members m
JOIN subscriptions s ON m.member_id = s.member_id
JOIN payments p ON s.subscription_id = p.subscription_id
GROUP BY m.name;

-- 11. Members without trainers
SELECT m.name FROM members m
LEFT JOIN trainer_assignments ta ON m.member_id = ta.member_id
WHERE ta.trainer_id IS NULL;

-- 12. Plans with more than 1 month
SELECT * FROM plans WHERE duration_months > 1;

-- 13. Trainer specializations
SELECT DISTINCT specialization FROM trainers;

-- 14. Members per trainer
SELECT t.name, COUNT(ta.member_id) AS Total_Members
FROM trainers t
JOIN trainer_assignments ta ON t.trainer_id = ta.trainer_id
GROUP BY t.name;

-- 15. Last payment by each member
SELECT m.name, MAX(p.payment_date) AS Last_Payment
FROM members m
JOIN subscriptions s ON m.member_id = s.member_id
JOIN payments p ON s.subscription_id = p.subscription_id
GROUP BY m.name;


-- drop database gym;