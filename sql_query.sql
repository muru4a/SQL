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
                                                     
11. #Delete Duplicate Emails
                                                     
Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.
For example, after running your query, the above Person table should have the following rows:

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Note:

Your output is the whole Person table after executing your sql. Use delete statement.

SQL:

Delete from Person where id not in ( select min(id) from Person group by Email ) 


12 # Rising Temperature

Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.
+---------+---------------------------+------------------------+
| Id(INT) | RecordDate(DATE) | Temperature(INT) |
+---------+---------------------------+------------------------+
|       1   |       2015-01-01         |               10           |
|       2   |       2015-01-02         |               25           |
|       3   |       2015-01-03         |               20           |
|       4   |       2015-01-04         |               30           |
+---------+---------------------------+-------------------------+

For example, return the following Ids for the above Weather table:
+----+
| Id   |
+----+
|  2   |
|  4   |
+——+

SQL:

Select id from Weather w1 join Weather w2 on 
W1.id=w2.id and
Datediff(day,w2.RecordDate,w1.RecordDate) =1
And w2.Temperature > w1.Temperature;

13. # Trips and Users    

The Trips table holds all taxi trips. Each trip has a unique Id, while Client_Id and Driver_Id are both foreign keys to the Users_Id at the Users table. Status is an ENUM type of (‘completed’, ‘cancelled_by_driver’, ‘cancelled_by_client’).
+----+------------+-------------+----------+----------------------------+---------------+
| Id  | Client_Id | Driver_Id | City_Id |        Status                |Request_at |
+----+------------+-------------+----------+----------------------------+---------------+
| 1   |     1         |    10        |    1        |     completed             | 2013-10-01|
| 2   |     2         |    11        |    1        | cancelled_by_driver  | 2013-10-01|
| 3   |     3         |    12        |    6        |     completed             |2013-10-01 |
| 4   |     4         |    13        |    6        | cancelled_by_client  |2013-10-01 |
| 5   |     1         |    10        |    1        |     completed             |2013-10-02 |
| 6   |     2         |    11        |    6        |     completed             |2013-10-02 |
| 7   |     3         |    12        |    6        |     completed             |2013-10-02 |
| 8   |     2         |    12        |     12     |     completed             |2013-10-03 |
| 9   |     3         |    10        |    12      |     completed             |2013-10-03 | 
| 10 |     4         |    13        |    12      | cancelled_by_driver |2013-10-03 |
+----+------------+------------+-----------+----------------------------+---------------+

The Users table holds all users. Each user has an unique Users_Id, and Role is an ENUM type of (‘client’, ‘driver’, ‘partner’).
+----------+-------------+---------+
| Users_Id | Banned |  Role  |
+----------+-------------+---------+
|    1       |   No          | client  |
|    2       |   Yes         | client  |
|    3       |   No          | client  |
|    4       |   No          | client  |
|    10     |   No          | driver  |
|    11     |   No          | driver  |
|    12     |   No          | driver  |
|    13     |   No          | driver  |
+----------+-------------+---------+

Write a SQL query to find the cancellation rate of requests made by unbanned users (both client and driver must be unbanned) between Oct 1, 2013 and Oct 3, 2013. The cancellation rate is computed by dividing the number of canceled (by client or driver) requests made by unbanned users by the total number of requests made by unbanned users.

For the above tables, your SQL query should return the following rows with the cancellation rate being rounded to two decimal places.
+---------------+-------------------------+
|     Day         | Cancellation Rate |
+---------------+-------------------------+
| 2013-10-01 |       0.33                |
| 2013-10-02 |       0.00                |
| 2013-10-03 |       0.50                |
+---------------+————————————+

SQL:

select trip.Request_at as Day
      ,cast(sum(case when trip.Status = 'completed' then 0 else 1 end) / (count(*) * 1.0 ) as decimal(18,2) ) as "Cancellation Rate"
      from de.Trips trip
inner join de.Users cust
        on cust.Users_id = trip.Client_id
       and cust.Role = 'client'
       and cust.Banned = 'No'
inner join de.Users drvr
        on drvr.Users_id = trip.Driver_id 
       and drvr.Role = 'driver'
       and drvr.Banned = 'No'
       and trip.Request_at between '2013-10-01' and '2013-10-03'
  group by trip.Request_at


14. # Game Play Analysis I

Table: Activity
+--------------------+----------+
| Column Name  | Type    |
+--------------------+----------+
| player_id           | int       |
| device_id          | int       |
| event_date       | date    |
| games_played | int        |
+-------------------+----------+
(player_id, event_date) is the primary key of this table.
This table shows the activity of players of some game.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device.
 
Write an SQL query that reports the first login date for each player. The query result format is in the following example:

Activity table:
+------------+--------------+----------------+---------------------+
| player_id | device_id | event_date  | games_played  |
+------------+--------------+----------------+---------------------+
| 1             | 2               | 2016-03-01 | 5                       |
| 1             | 2               | 2016-05-02 | 6                       |
| 2             | 3               | 2017-06-25 | 1                       |
| 3             | 1               | 2016-03-02 | 0                       |
| 3             | 4               | 2018-07-03 | 5                       |
+------------+--------------+----------------+---------------------+

Result table:
+------------+-----------------+
| player_id | first_login     |
+------------+-----------------+
| 1             | 2016-03-01  |
| 2             | 2017-06-25  |
| 3             | 2016-03-02  |
+------------+————————+


SQL:

Select player_id, min(event_date) as first_login from Activity
Group. By player_id

15. # Game Play Analysis II

Table: Activity
+--------------------+----------+
| Column Name  | Type    |
+--------------------+----------+
| player_id           | int       |
| device_id          | int       |
| event_date       | date    |
| games_played | int        |
+-------------------+----------+
(player_id, event_date) is the primary key of this table.
This table shows the activity of players of some game.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device.
 
Write a SQL query that reports the device that is first logged in for each player. The query result format is in the following example:

Activity table:
+------------+--------------+----------------+---------------------+
| player_id | device_id | event_date  | games_played  |
+------------+--------------+----------------+---------------------+
| 1             | 2               | 2016-03-01 | 5                       |
| 1             | 2               | 2016-05-02 | 6                       |
| 2             | 3               | 2017-06-25 | 1                       |
| 3             | 1               | 2016-03-02 | 0                       |
| 3             | 4               | 2018-07-03 | 5                       |
+------------+--------------+----------------+---------------------+

Result table:
+------------+--------------+
| player_id | device_id |
+------------+--------------+
| 1             | 2               |
| 2             | 3               |
| 3             | 1               |
+------------+———————+


SQL:

Select a.player_id, a.device_id from Activity  a join 
( select player_id, min(event_date) from Activity
Group by player_id )  b join 
On a.player_id=b.player_id
And a.event_date= b.event_date


16. # Game Play Analysis III

Table: Activity
+--------------------+----------+
| Column Name  | Type    |
+--------------------+----------+
| player_id          | int        |
| device_id         | int        |
| event_date       | date    |
| games_played | int        |
+--------------------+---------+
(player_id, event_date) is the primary key of this table.
This table shows the activity of players of some game.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device.
 
Write an SQL query that reports for each player and date, how many games played so far by the player. That is, the total number of games played by the player until that date. Check the example for clarity.
The query result format is in the following example:

Activity table:
+------------+--------------+----------------+---------------------+
| player_id | device_id | event_date  | games_played  |
+------------+--------------+----------------+---------------------+
| 1             | 2               | 2016-03-01 | 5                       |
| 1             | 2               | 2016-05-02 | 6                       |
| 1             | 3               | 2017-06-25 | 1                       |
| 3             | 1               | 2016-03-02 | 0                       |
| 3             | 4               | 2018-07-03 | 5                       |
+------------+--------------+----------------+---------------------+

Result table:
+-------------+---------------+------------------------------+
| player_id | event_date | games_played_so_far |
+-------------+---------------+------------------------------+
| 1              | 2016-03-01 | 5                                 |
| 1              | 2016-05-02 | 11                               |
| 1              | 2017-06-25 | 12                               |
| 3              | 2016-03-02 | 0                                 |
| 3              | 2018-07-03 | 5                                 |
+------------+-----------------+-----------------------------+
For the player with id 1, 5 + 6 = 11 games played by 2016-05-02, and 5 + 6 + 1 = 12 games played by 2017-06-25.
For the player with id 3, 0 + 5 = 5 games played by 2018-07-03.
Note that for each player we only care about the days when the player logged in.

SQL:
Using window function

select src.player_id
      ,src.event_date
      ,sum(games_played) over(partition by player_id order by event_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
      as games_played_so_far
from de.Activity src
order by src.player_id,src.event_date

Without window function , need to do inner join and compare the event_date < = 

select a.player_id,a.event_date,sum(b.games_played) as games_played_so_far from
de.Activity a join de.Activity b on 
a.player_id=b.player_id and
b.event_date <= a.event_date
group by a.player_id,a.event_date
order by a.player_id,a.event_date


17. # Game Play Analysis IV

Table: Activity
+--------------------+----------+
| Column Name  | Type    |
+--------------------+----------+
| player_id          | int        |
| device_id         | int        |
| event_date       | date    |
| games_played | int        |
+--------------------+---------+
(player_id, event_date) is the primary key of this table.
This table shows the activity of players of some game.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device. 

Write an SQL query that reports the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.
The query result format is in the following example:

Activity table:
+------------+--------------+----------------+---------------------+
| player_id | device_id | event_date  | games_played  |
+------------+--------------+----------------+---------------------+
| 1             | 2               | 2016-03-01 | 5                       |
| 1             | 2               | 2016-03-02 | 6                       |
| 2             | 3               | 2017-06-25 | 1                       |
| 3             | 1               | 2016-03-02 | 0                       |
| 3             | 4               | 2018-07-03 | 5                       |
+------------+--------------+----------------+---------------------+

Result table:
+-----------+
| fraction  |
+-----------+
| 0.33      |
+-----------+
Only the player with id 1 logged back in after the first day he had logged in so the answer is 1/3 = 0.33


SQL:

select cast((sum(case when b.player_id is null then 0 else 1 end) / (count(distinct a.player_id) * 1.0 )) as decimal(18,2) ) as fraction
 from de.Activity a
 left join (select player_id, min(event_date) as min_event_date from de.Activity group by player_id) b  on 
a.player_id=b.player_id and
b.min_event_date+1 = a.event_date 

18. # Median Employee Salary

The Employee table holds all employees. The employee table has three columns: Employee Id, Company Name, and Salary.
+-----+---------------+----------+
|Id    | Company    | Salary |
+-----+---------------+----------+
|1     | A                | 2341    |
|2     | A                | 341      |
|3     | A                | 15        |
|4     | A                | 15314  |
|5     | A                | 451      |
|6     | A                | 513      |
|7     | B                | 15        |
|8     | B                | 13        |
|9     | B                | 1154    |
|10   | B                | 1345    |
|11   | B                | 1221    |
|12   | B                | 234      |
|13   | C                | 2345    |
|14   | C                | 2645    |
|15   | C                | 2645    |
|16   | C                | 2652    |
|17   | C                | 65        |
+-----+---------------+----------+

Write a SQL query to find the median salary of each company. Bonus points if you can solve it without using any built-in SQL functions.
+-----+---------------+----------+
|Id    | Company    | Salary |
+-----+---------------+----------+
|5     | A                | 451      |
|6     | A                | 513      |
|12   | B                | 234      |
|9     | B                | 1154    |
|14   | C                | 2645   |
+-----+---------------+----------+

-- analyze: 
select src.Id, src.Company, src.Salary ,alis.Id, alis.Company, alis.Salary 
      ,case when src.Salary = alis.Salary then 1 else 0 end as match
      ,case when src.Salary - alis.Salary > 0 then 1 
                    when src.Salary - alis.Salary <0 then -1 end as up_down
      from p_gdat_t.J00_Employee src   
inner join p_gdat_t.J00_Employee alis
        on alis.Company = src.Company
  order by 1, 2,3,6; 


19. # Managers with at Least 5 Direct Report

The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

+------+------------+---------------+---------------+
|Id      |Name      |Department |ManagerId |
+------+------------+----------------+--------------+
|101   |John        |A                 |null            |
|102   |Dan         |A                 |101            |
|103   |James     |A                 |101            |
|104   |Amy        |A                 |101            |
|105   |Anne       |A                 |101            |
|106   |Ron         |B                 |101            |
+------+------------+---------------+--------------+

Given the Employee table, write a SQL query that finds out managers with at least 5 direct report. For the above table, your SQL query should return:
+---------+
| Name  |
+---------+
| John    |
+————+

SQL:

select mg.Name 
from de.Employee_1 em 
join de.Employee_1 mg
     on em.ManagerId =mg.Id
group by mg.Name having count(distinct em.Id) >=5


20. # Winning Candidate

Table: Candidate
+-----+-----------+
| id    | Name    |
+-----+-----------+
| 1     | A          |
| 2     | B          |
| 3     | C          |
| 4     | D          |
| 5     | E          |
+-----+-----------+  

Table: Vote
+-----+-----------------+
| id    | CandidateId  |
+-----+-----------------+
| 1     |     2               |
| 2     |     4               |
| 3     |     3               |
| 4     |     2               |
| 5     |     5               |
+-----+------------------+
id is the auto-increment primary key,
CandidateId is the id appeared in Candidate table.

Write a sql to find the name of the winning candidate, the above example will return the winner B.
+--------+
| Name |
+--------+
| B        |
+--------+

SQL:

select c.Name from de.Candidate c join 
(select top 1 count(*),CandidateId from de.Vote group by CandidateId order by count(*) DESC) v
ON c.id =v.CandidateId

21. # Employee Bonus

Select all employee's name and bonus whose bonus is < 1000.

Table:Employee
+---------+------------+-------------+---------+
| empId |  name     | supervisor| salary |
+---------+------------+-------------+---------+
|   1       | John       |  3             | 1000   |
|   2       | Dan        |  3             | 2000   |
|   3       | Brad       |  null          | 4000   |
|   4       | Thomas  |  3             | 4000   |
+---------+------------+-------------+---------+
empId is the primary key column for this table.

Table: Bonus
+-------+-------+
| empId | bonus |
+-------+-------+
| 2     | 500   |
| 4     | 2000  |
+-------+-------+
empId is the primary key column for this table.

Example ouput:
+-------+-------+
| name  | bonus |
+-------+-------+
| John  | null  |
| Dan   | 500   |
| Brad  | null  |
+-------+———+

SQL:

select e.Name, b.bonus  from de.Employee e 
left join de.Bonus b 
ON 
e.EmpId =b.EmpId 
Where b.EmpId is null OR b.Bonus <1000;

22. # Get Highest Answer Rate Question

Get the highest answer rate question from a table survey_log with these columns: uid, action, question_id, answer_id, q_num, timestamp.
uid means user id; action has these kind of values: "show", "answer", "skip"; answer_id is not null when action column is "answer", while is null for "show" and "skip"; q_num is the numeral order of the question in current session.
Write a sql query to identify the question which has the highest answer rate.

Example: Input:
+------+-----------+----------------+---------------+-------------+----------------+
| uid  | action    | question_id  | answer_id  | q_num     | timestamp  |
+------+-----------+----------------+---------------+-------------+----------------+
| 5    | show      | 285              | null             | 1              | 123            |
| 5    | answer   | 285              | 124124      | 1              | 124            |
| 5    | show      | 369              | null             | 2              | 125            |
| 5    | skip        | 369              | null             | 2              | 126            |
+------+-----------+----------------+---------------+-------------+----------------+

Output:
+---------------+
| survey_log  |
+---------------+
|    285          |
+---------------+

Explanation: question 285 has answer rate 1/1, while question 369 has 0/1 answer rate, so output 285. 
Note: The highest answer rate meaning is: answer number's ratio in show number in the same question.                                                     
                                                     
