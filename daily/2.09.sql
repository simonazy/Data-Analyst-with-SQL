--------------- 一周内每天的每类视频点赞量和转发量--------------
-- window function
-- partion by <> order by date rows 6 proceding
-- partion by <> order by date rows between 6 proceding and current row       (date升序排序，向前6行)
-- partion by <> order by date desc rows between current row and 6 following  (date降序排列，当前行往后6行)

SELECT * FROM(
SELECT tag, d, 
SUM(if_like_sum) over(PARTITION BY tag ORDER BY d rows 6 PRECEDING),
MAX(if_retweet_sum) over(PARTITION BY tag ORDER BY d rows 6 PRECEDING)
from(
SELECT tag, 
DATE(start_time) AS d, 
sum(if_retweet) as if_retweet_sum, 
sum(if_like) as if_like_sum 
from tb_user_video_log t1,tb_video_info t2 WHERE t1.video_id=t2.video_id
GROUP BY tag,d) t3) temp
-- 最后筛选国庆期间
where d BETWEEN '2021-10-01' and '2021-10-03'
ORDER BY tag DESC, d ASC

-- 拆分
-- 每类视频每天的一周最大单天转发量
SELECT tag, d, MAX(if_retweet_sum) over(PARTITION BY tag ORDER BY d rows 6 PRECEDING)
from(
SELECT tag, DATE(start_time) AS d, sum(if_retweet) as if_retweet_sum FROM
tb_user_video_log t1,tb_video_info t2
WHERE t1.video_id=t2.video_id
GROUP BY tag,d) t3

-- 每类视频近一周总点赞量
SELECT tag, d, SUM(if_like_sum) over(PARTITION BY tag ORDER BY d rows 6 PRECEDING)
from
(SELECT tag, DATE(start_time) as d, sum(if_like) as if_like_sum FROM
tb_user_video_log t1,tb_video_info t2
WHERE t1.video_id=t2.video_id
GROUP BY tag,d) t4

--------得分不小于平均分的最低分----------------
-- 过滤
select 
    min(score) 
from 
    exam_record e 
    left join examination_info i on e.exam_id=i.exam_id
-- keypoint： 过滤的两个条件：tag， score >= (先求出平均值)
where score >= (select avg(score) as sql_avg from exam_record t1 
left join examination_info t2 on t1.exam_id = t2.exam_id
where tag="SQL" and score is NOT NULL
group by tag) and tag="SQL"