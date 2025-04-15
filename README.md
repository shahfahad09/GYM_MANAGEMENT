# Gym Management System – SQL Database Project

This project presents a fully functional Gym Management System built with MySQL. It simulates real-world gym operations using a relational database. The database includes table creation, data insertion, and complex SQL queries for analysis and reporting.

---

## Database Name: `gym`

This database manages the backend structure of a gym, including members, trainers, plans, payments, and more.

---

## Tables and Their Purpose:

1. **accounts**  
   Stores login credentials of users (both admins and gym members).  
   - Fields: `account_id`, `username`, `password`, `role`

2. **members**  
   Contains personal and contact details of gym members.  
   - Fields: `member_id`, `name`, `gender`, `dob`, `contact`, `join_date`, `account_id`

3. **plans**  
   Holds information about subscription plans available at the gym.  
   - Fields: `plan_id`, `plan_name`, `duration`, `price`

4. **subscriptions**  
   Tracks which member is subscribed to which plan and for how long.  
   - Fields: `subscription_id`, `member_id`, `plan_id`, `start_date`, `end_date`

5. **payments**  
   Records payment details made by members.  
   - Fields: `payment_id`, `member_id`, `amount`, `payment_date`, `mode`

6. **trainers**  
   Maintains information about gym trainers.  
   - Fields: `trainer_id`, `name`, `specialization`, `contact`

7. **trainer_assignments**  
   Maps trainers to members (one trainer can handle multiple members).  
   - Fields: `assignment_id`, `member_id`, `trainer_id`

---

## Entity-Relationship (ER) Overview:

- Each member is linked with an account  
- Members purchase plans via subscriptions  
- Subscriptions are tied to payments  
- Trainers are assigned to members through trainer_assignments

---

## Sample Data Inserted:

- 10 Members (male/female, different join dates)  
- 3 Plans: Basic (1 month), Standard (3 months), Premium (6 months)  
- 5 Trainers (Yoga, Strength, Cardio, CrossFit, General Fitness)  
- Payments made by most members  
- Some members have not been assigned trainers (for query testing)

---

## 15 Must-Know SQL Queries Included:

1. List members with their respective subscription plans  
2. Calculate total revenue earned from all payments  
3. Display names of members enrolled in the Premium plan  
4. Show trainers along with their assigned members  
5. Fetch members who joined between two specific dates  
6. Count the number of male and female members  
7. Identify the most expensive subscription plan  
8. Find subscriptions that are expiring in the current month  
9. Show account credentials along with user roles  
10. Display total payments made by each member  
11. List members who haven’t been assigned a trainer  
12. Show plans with a duration greater than 1 month  
13. Display the specializations of all trainers  
14. Count how many members are being handled by each trainer  
15. Show the date of the last payment made by each member  

---

## How to Run the Project

1. Open phpMyAdmin, MySQL Workbench, or any MySQL CLI tool  
2. Import or copy-paste the contents of the SQL script file: `GYM MANAGEMENT PROJECT.sql`  
3. Execute the script to create tables, insert data, and run queries  
4. Analyze the query outputs or enhance them as needed

---

## Project Highlights

- Fully normalized and modular database design  
- Simulates real-world gym workflow with data relationships  
- Ideal for beginners learning SQL and database design  
- Includes analytical queries useful for business insights

---

## Optional Cleanup Script

To remove the database completely:

```sql
DROP DATABASE gym;
