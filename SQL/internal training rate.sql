/* Developer: Thomas Hoefler
COMMENT: 

REQUIREMENTS: select the rate of completed courses for internal learning
*/
with 
cnt as
	(select count(*) as total_count,
	sum(case when completion_status_descr = 'Complete' then 1 else 0 end) as complete_count
	from learning.LEARNING_INTERNAL_TRAINING),
rate as 
	(select total_count,complete_count, 
	case when complete_count = 0 then -1 else (cast(complete_count as double)/cast(total_count as double)) end as completion_rate
	from cnt)
select * from rate;