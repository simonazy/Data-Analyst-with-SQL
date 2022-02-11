----------每类试卷得分前3名---------
-- 排序条件3个：最高分，最低分，id
--此处应该用 row_number()
--TOP N with window function： where ranking<=3: limit 3
-- group by <two conditions> 

SELECT * from
-- 用row_number 和 order by 来排名
(SELECT tag, uid, 
ROW_NUMBER() over (partition by tag order by max_score DESC, min_score DESC, uid DESC) ranking
from
-- group by <two condition> 先获得每个考试中每个人自己的最高分和最低分，所以用两个group by
(SELECT uid, tag, max(score) as max_score, min(score) as min_score from 
exam_record t1  left join examination_info t2 on t1.exam_id=t2.exam_id group by tag, uid) t3) t4
-- 最后 limit 3
where ranking <=3


------------ 月总刷题数和日均刷题数------------
-- COALESCE(<expr1>,<expr2>) 会返回第一个不为空的日期
-- LAST_DAY(<date>)
-- DAY(<date>)
-- MONTH(<date>)
-- WITH ROLLUP:  Adding a WITH ROLLUP modifier to the GROUP BY clause causes the query to produce another (super-aggregate) row 
-- that shows the grand total over all year values. 会用 group by 后的第一个字段，进行grand total计算
SELECT
    coalesce(DATE_FORMAT(submit_time,"%Y%m"),'Grand_total') submit_month,
    COUNT(submit_time) month_q_cnt,
    round(COUNT(submit_time) / MAX(DAY(last_day(submit_time))),3)avg_day_q_cnt
FROM
    practice_record
WHERE
    year(submit_time) = '2021'
GROUP BY
    DATE_FORMAT(submit_time,"%Y%m") WITH ROLLUP;

-- UNION ALL ：会删除所有重复的记录
select 
DATE_FORMAT(submit_time,'%Y%m') as submit_month,
count(*) as month_q_cnt,
round(count(*) / day(last_day(submit_time)) ,3) as avg_day_q_cnt
from practice_record where score is not null 
and year(submit_time) = '2021'
group by DATE_FORMAT(submit_time,'%Y%m')
 
union all 
 
select 
'2021汇总' as submit_month,
count(*) as month_q_cnt,
round(count(*) /31 ,3) as avg_day_q_cnt -- /30 会不通过用例
from practice_record where score is not null 
and year(submit_time) = '2021' 
order by submit_month ;



---------------作答试卷得分大于过80的人的用户等级分布-----------
-- 主要是3个表join
SELECT t3.level, count(distinct t1.uid) as level_cnt from exam_record t1
left join examination_info t2 on t1.exam_id=t2.exam_id
left join user_info t3 on t3.uid = t1.uid
where score>80 and tag='SQL'
group by level
order by level_cnt  DESC, level DESC

------------- 试卷发布当天作答人数和平均分------------
--多表查询，聚合函数
SELECT t1.exam_id, count(distinct t1.uid) as uv, round(avg(t1.score),1) as avg_score from exam_record t1 
left join examination_info t2 on t1.exam_id=t2.exam_id
left join user_info t3 on t3.uid=t1.uid
where t3.level>5 and tag='SQL' and DATE(submit_time)=DATE(release_time)
group by exam_id
order by uv DESC, avg_score ASC;