# 185. Department Top Three Salaries

select Department,Employee,Salary from (
select d.name as Department,e.name as Employee,e.Salary,
dense_rank() over( partition by d.Id order by e.Salary DESC) as rnk from 
Employee e join Department d on 
e.DepartmentId = d.Id) a
 where rnk<=3
