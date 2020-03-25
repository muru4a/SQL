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
                                                     
SQL:

Select l1.Num as ConsecutiveNums from Logs l1
Join logs l2 ON
L2.Num =l1.Num
And l2.id =l1.id+1
Join Logs l3 ON
l3.Num =l2.Num
And l3.id =l2.id +1
Group by l1.Num;
                                                     
6. # Employees earning more than their Managers 
Question: The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id. Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 

Table: Employees
+----+--------+---------+---------------+
| Id | Name  | Salary | ManagerId |
+----+--------+---------+---------------+
| 1  | Joe   | 70000  | 3                 |
| 2  | Henry | 80000  | 4               |
| 3  | Sam   | 60000  | NULL        |
| 4  | Max   | 90000  | NULL         |
+----+--------+---------+---------------+

For the above table, Joe is the only employee who earns more than his manager.
+----------+
| Employee |
+----------+
| Joe      |
+—————+

SQL:

Select Name from Employees e join Employees m on
e.ManagerId = m.Id 
And e.ManagerId is not null
And e.Salary > m.Salary; 
                                                     

7. # Duplicate emails 
Question: Write a SQL query to find all duplicate emails in a table named Person.

Table: Person
+----+-------------+
| Id | Email        |
+----+-------------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+------------+

For example, your query should return the following for the above table:
+-------------+
| Email       |
+-------------+
| a@b.com |
+——————+

SQL:

Select Email from Person group by Email having count(*)>1;


8. # Customers who never order 
Question: Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

Table: Customers.
+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe     |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max    |
+----+-------+

Table: Orders.
+----+---------------+
| Id | CustomerId |
+----+---------------+
| 1  | 3                |
| 2  | 1                |
+----+--------------+

Using the above tables as example, return the following:
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+—————+

SQL:

Select c.Name from Customers c left join Order o on
c.id = o.CustomerId
Where o.CustomerId is Null;

9. # Department Highest Salary

The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.
+----+---------+---------+-------------------+
| Id  | Name  | Salary | DepartmentId |
+----+---------+---------+-------------------+
| 1   | Joe      | 70000  | 1                   |
| 2   | Jim      | 90000  | 1                   |
| 3   | Henry  | 80000  | 2                   |
| 4   | Sam    | 60000  | 2                   |
| 5   | Max     | 90000  | 1                  |
+----+---------+----------+-----------------+

The Department table holds all departments of the company.
+----+------------+
| Id  | Name     |
+----+------------+
| 1    | IT           |
| 2    | Sales     |
+----+------------+

Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, your SQL query should return the following rows (order of rows does not matter).
+----------------+--------------+---------+
| Department | Employee | Salary |
+----------------+--------------+---------+
| IT                | Max           | 90000  |
| IT                | Jim            | 90000  |
| Sales          | Henry        | 80000  |
+----------------+--------------+—————+

SQL:

Select Department, Employee,Salary from Employee e 
Join Department d on e.DepartmentId =d.id
Join (select DepartmentId,max(Salary) as mSalary from Employee group by DepartmentId ) m
On m.DepartmentId =e.DepartmentId
And m.mSalary=e.Salary;

10. # Department Top Three Salaries    
The Employee table holds all employees. Every employee has an Id, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 85000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
| 7  | Will  | 70000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL query should return the following rows (order of rows does not matter).

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Joe      | 85000  |
| IT         | Will     | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+————+

SQL:
Select Department,Employee,Salary from 
(Select d.name as Department, e.name as Employee, e.Salary as Salary, 
 dense_rank () over( partition by Department order by d.name,e.salary) as rank
From Employee e join Department d on
E.DepartmentId =d.id ) a
Where a.rank <=3;                                                     
                                                     
