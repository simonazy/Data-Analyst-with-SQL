
-------统计作答次数
SELECT count(*) as total_pv, 
SUM(if(score is NOT NULL,1,0)) as complete_pv, 
COUNT(distinct if(score is NoT NULL,exam_id,null)) as complete_exam_cnt
FROM exam_record 

------平均活跃天数和月活人数----------
-- DATE_FROMAT(<date>, "%Y%m")
-- count(distinct <tow conditions>)
SELECT DATE_FORMAT(start_time, '%Y%m') as month,
round(count(distinct uid, DATE_FORMAT(start_time, "%y%m%d"))/count(distinct uid),2) as avg_active_days,
count(distinct uid) as mau
                                           from exam_record
                                           where submit_time is not NULL and year(submit_time)=2021
                                           group by month