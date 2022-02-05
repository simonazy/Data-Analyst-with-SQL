------复习case when的语法-------
--1--
--先创建一个cte，虚拟table
WITH cte AS(

    SELECT customerName,count(*) orderCount from orders
    INNER JOIN customers 
    USING (customerNumber)
    GROUP BY customerName
)
-- case 通常会根据一列的条件，创建另外一列
SELECT customerName, orderCount, 
case orderCount
WHEN 1 THEN 'One-time Customer'
WHEN 2 THEN 'Repeated Customer'
WHEN 3 THEN 'Frequent Customer'
ELSE 'Loyal Customer'
end customerType
from cte
order by customerName

--2--
--case和aggregate一起
SELECT 
    SUM(CASE WHEN status = 'Shipped' THEN 1 ELSE 0 END) AS 'Shipped',
    SUM(CASE WHEN status = 'On Hold' THEN 1 ELSE 0 END) AS 'On Hold',
    SUM(CASE WHEN status = 'In Process' THEN 1 ELSE 0 END) AS 'In Process',
    SUM(CASE WHEN status = 'Resolved' THEN 1 ELSE 0 END) AS 'Resolved',
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS 'Cancelled',
    SUM(CASE WHEN status = 'Disputed' THEN 1 ELSE 0 END) AS 'Disputed',
    COUNT(*) AS Total
FROM
    orders;

------复习dense rank------
-- create table
CREAT TABLE t(
    val INT
)
--insert into multiple records
INSERT INTO t (val)
values (1),(2),(3),(4),(8);
-- dense rank
SELECT val, DENSE_RANK() OVER(ORDER BY val) my_rank FROM t;

--dense rank 会创建新的一列来表示排名
SELECT
    sales_employee,
    fiscal_year,
    sale,
    DENSE_RANK() OVER(PARTITION BY fiscal_year ORDER BY sale DESC) sales_rank
from 
    sales;

---------join的另一种写法--------
SELECT agents.agent_code, agents.agent_name, SUM(orders.advance_amount)
FROM agents,orders
WHERE agents.agent_code=orders.agent_code
GROUP BY agents.agent_code,agents.agent_name
ORDER BY agents.agent_code;