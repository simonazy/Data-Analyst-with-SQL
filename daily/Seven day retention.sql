---Seven day retention
SELECT login_day, diff, SUM(login_or_not)/COUNT(*) as retention 
FROM(
SELECT t1.id, login_day, diff,(CASE t2.id is NULL then 0 ELSE 1 END) as login_or_not FROM
-- define new users on 02/01
((SELECT id, login_day from User 
GROUP BY id having min(login_day)='2022-02-01') t1 LEFT JOIN 
-- all the login record and calculated the data diff
(SELECT id, DATEDIFF(login_day, '2022-02-01') as diff FROM User
where login_day between '2022-02-02' and '2022-02-08') t2
on t1.id=t2.id) t3) temp 
GROUP BY longin_day, diff; 
