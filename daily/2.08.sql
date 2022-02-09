---- 各个视频的平均完播率 ----
-- ROUND()
-- IF(<EXP>,1,0)
-- COUNT()
-- YEAR(<DATE>)
-- TIMESTAMPDIFF()
SELECT a.video_id ,
       ROUND(AVG(IF(TIMESTAMPDIFF(second, start_time, end_time) >= b.duration, 1, 0)),3) avg_comp_play_rate
FROM tb_user_video_log a
LEFT JOIN tb_video_info b ON a.video_id = b.video_id
WHERE YEAR(start_time) = 2021
GROUP BY a.video_id
ORDER BY avg_comp_play_rate desc;

-----平均播放进度大于60%的视频类别----
-- concat()
-- avg()
-- TIMESTAMPDIFF(unit,<date1>,<date2>)
SELECT tag, CONCAT(avg_1,"%") as avg_play_progress  
from (
SELECT tag, 
ROUND(AVG(if((TIMESTAMPDIFF(second,start_time,end_time)/duration)>=1,1,(TIMESTAMPDIFF(second,start_time,end_time)/duration)))*100,2) AS avg_1 
FROM tb_user_video_log t1 left join tb_video_info t2 on t1.video_id = t2.video_id
GROUP BY tag 
HAVING avg_1>60)t
ORDER BY avg_play_progress DESC

----------每类视频近一个月的转发量/率---------
-- TIMEDIFF()
-- 不能直接写MAX(start_time)，where后面不能跟集函数，having后面倒是常跟集函数。
-- 顺序： select ，from， where， groupby，orderby 或者 select ，from，groupby， having，orderby
select tag, sum(if_retweet) as retweet_cnt, round(sum(if_retweet)/count(t1.video_id),3) as retweet_rate
from tb_user_video_log t1 left join tb_video_info t2 on t1.video_id=t2.video_id
where TIMESTAMPDIFF(DAY, start_time, (SELECT max(start_time) from tb_user_video_log)) <30
group BY tag
order by retweet_rate DESC

--关于时间处理：
-- DATEDIFF() :返回相差多少天
SELECT b.tag, SUM(if_retweet) retweet_cnt, ROUND(SUM(if_retweet)/COUNT(*), 3) retweet_rate
FROM tb_user_video_log a
LEFT JOIN tb_video_info b
ON a.video_id = b.video_id
WHERE DATEDIFF((select max(start_time) FROM tb_user_video_log), a.start_time) <= 29
GROUP BY b.tag
ORDER BY retweet_rate desc

-- DATE_ADD(<date>, interval 30 day)
-- DATE_SUB(<date>, interval 30 day)


----------每个创作者每月的涨粉率及截止当前的累加粉丝量---------
-- DATE_FORMAT(<DATE>,"%Y-%m-%d")
-- CASE WHEN <EXP> THEN <EXP>
-- SUM() OVER(PARTITION BY <> ORDER BY <DATE>) 累加 running_total
-- GROUP BY 两个条件
SELECT
    author,
    date_format(start_time,'%Y-%m') month,
    round(sum(case when if_follow=1 then 1
                   when if_follow=2 then -1
                   else 0 end)/count(*),3) as fans_growth_rate,
     sum(sum(case when if_follow=1 then 1
                  when if_follow=2 then -1
                  else 0 end)) over(partition by author order by date_format(start_time,'%Y-%m')) total_fans
FROM tb_user_video_log log
left join tb_video_info info on log.video_id=info.video_id
where year(start_time)=2021
group by author,month
order by author,total_fans 