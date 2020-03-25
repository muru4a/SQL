1. # Combine two tables
Question: Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:
FirstName, LastName, City, State

Table: Person
+-------------+---------------+
| Column Name | Type    |
+-------------+----------------+
| PersonId    | int             |
| FirstName   | varchar    |
| LastName    | varchar   |
+-------------+----------------+
PersonId is the primary key column for this table.

Table: Address
+-------------+---------------+
| Column Name | Type    |
+-------------+---------------+
| AddressId   | int             |
| PersonId    | int              |
| City        | varchar          |
| State       | varchar         |
+-------------+----------------+
AddressId is the primary key column for this table.

SQL:

Select p.FirstName, p.LastName ,a.city, a.state from Person p
 left join Address a 
on  p.PersonId=a.PersonId;


2. # Second Highers Salary
Question: Write a SQL query to get the second highest salary from the Employee table.

Table: Employee
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+

For example, given the above Employee table, the query should return 200 as the second highest salary. If there is no second highest salary, then the query should return null.
+-----------------------------+
| SecondHighestSalary |
+-----------------------------+
| 200                             |
+——————————————+

SQL:

Select max(Salary) as SecondHighestSalary from Employee where salary < ( select max(Salary) from Employee)


3. # Nth Highest Salary 
Write a SQL query to get the nth highest salary from the Employee table.

Table: Employee
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100     |
| 2  | 200     |
| 3  | 300     |
+----+--------+

For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.
+----------------------------+
| getNthHighestSalary |
+----------------------------+
| 200                            |
+——————————————+

SQL:

Select emp1.Salary from Employee emp1 where (N-1) = ( select count( distinct(emp2.Salary) from Employee emp2
Where emp2.Salary > emp1.Salary)

4. # Rank Scores 
Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.

Table: Scores
+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+

For example, given the above Scores table, your query should generate the following report (order by highest score):
+-------+------+
| Score | Rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+———+

SQL:
Select Score, dense_rank() over( order by Score DESC) as Rank from Scores

5. # Consecutive Numbers    
Question: Write a SQL query to find all numbers that appear at least three times consecutively.

Table: Logs
+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+

For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.
+------------------------+
| ConsecutiveNums |
+------------------------+
| 1                            |
+————————————+
