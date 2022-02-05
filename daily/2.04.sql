### 2.04
## second highest salary, cannot use order by
# 主要考点是：嵌套query； max(); where条件过滤
select e.emp_no, s.salary, last_name, first_name from employees e
left join salaries s on e.emp_no = s.emp_no
where s.salary=
(select max(salary) from salaries where salary <(select max(salary) from salaries))

## 下面是同一题的不同解法：
# 1.创建虚拟表subquery；2. 三个表left join链接
select e.last_name, e.first_name, a.dept_name from employees e
left join
(select d.dept_name, t.emp_no, t.dept_no from departments d
right join dept_emp t on d.dept_no=t.dept_no) a
on e.emp_no = a.emp_no


select last_name, first_name, dept_name from employees e
left join dept_emp d on e.emp_no = d.emp_no
left join departments on departments.dept_no = d.dept_no

## 找工资涨幅
# 法一：嵌套了3个subquery，创建虚拟表
select s1.emp_no, (s1.salary-s2.salary) as growth FROM
(
	--第一个表先找到开始工资
(select emp_no, salary from salaries where to_date='9999-01-01')s1
join
	--第二个表找到现在工资
(select s.emp_no, s.salary from salaries s join employees as e
on e.emp_no = s.emp_no and e.hire_date=s.from_date) s2
	--链接两个temp表
	on s1.emp_no = s2.emp_no
)
order by growth

# 法二： 自链接
select t1.emp_no,
sum(t2.salary-t1.salary)as growth
--自链接
from salaries t1 join salaries t2
on t1.to_date=t2.from_date and t1.emp_no=t2.emp_no
--过滤
where t1.emp_no in
(select emp_no
from salaries
where to_date="9999-01-01"
)
group by emp_no
order by growth

# 法3：lag 第一个值会空出来
select emp_no, sum(change_salary) as growth from(
	--lag(salary) over(partition by emp_no order by from_date 得出变化前before_change的值
select *, salary-lag(salary) over(partition by emp_no order by from_date) change_salary from salaries
-- 通过日期过滤出还在职的员工
where emp_no in (select emp_no from salaries where to_date='9999-01-01')) t1
group by emp_no
order by growth；

## 排名
# 用 dense_rank()
select emp_no, salary, dense_rank() over(order by salary desc) as t_rank
from salaries
order by t_rank asc,emp_no


## 找出每个部门里maanger工资高的员工
# 虚拟表subquery
# 下面两个是同样的方法：先找到部门最高工资t1<-找到所有manager的工资t2<-连接前面t1和t2表<-用where条件筛选
# 第一个方法的t1里面没有写left join
select t1.emp_no, t2.emp_no as manager_no, t1.max_of_dept as emp_salary, t2.salary as manager_salary from
(select de.emp_no, dept_no, max(s.salary) max_of_dept from dept_emp de, salaries s
where s.emp_no=de.emp_no GROUP by dept_no) t1
join
(select dm.dept_no, dm.emp_no, s.salary from dept_manager dm
left join salaries s on s.emp_no = dm.emp_no) t2
on t1.dept_no=t2.dept_no
where t1.max_of_dept>t2.salary

select t1.emp_no, t2.emp_no as manager_no, t1.max_of_dept as emp_salary, t2.salary as manager_salary from
((select de.emp_no, de.dept_no, max(s.salary) as max_of_dept from dept_emp de
left join salaries s on s.emp_no=de.emp_no GROUP by de.dept_no) t1
join
(select dm.dept_no, dm.emp_no, s.salary from dept_manager dm
left join salaries s on s.emp_no = dm.emp_no) t2
on t1.dept_no=t2.dept_no)
where t1.max_of_dept>t2.salary



##  汇总各个部门当前员工的title类型的分配数目
select d.dept_no, d.dept_name, title, count(t.emp_no) as count from titles t 
left join dept_emp de on t.emp_no = de.emp_no
left join departments d on d.dept_no=de.dept_no
--多多思考一下这里group by的逻辑（可以不要dept_no，因为no和name是一样的）
group by d.dept_no,d.dept_name,title
order by d.dept_no

--和上面一样的思路，不同的写法，
select d.dept_no,
       d.dept_name,
       t.title,
       count(t.title)as count
from departments d,dept_emp de,titles t
where de.emp_no=t.emp_no
and de.dept_no=d.dept_no
group by d.dept_no,t.title

