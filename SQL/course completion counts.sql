/* Developer: Thomas Hoefler
COMMENT: 

REQUIREMENTS: count completion types per course
*/
select item_id,item_descr,item_type,item_title,
  (SELECT COUNT(*)  FROM learning.LEARNING_INTERNAL_TRAINING t1 WHERE I.item_id  = t1.item_id  AND t1.completion_status_descr = 'No Show' ) as  no_show_count,
  (SELECT COUNT(*)  FROM learning.LEARNING_INTERNAL_TRAINING t2 WHERE I.item_id  = t2.item_id  AND t2.completion_status_descr = 'Failed') as failed_count,
  (SELECT COUNT(*)  FROM learning.LEARNING_INTERNAL_TRAINING t3 WHERE I.item_id  = t3.item_id  AND t3.completion_status_descr = 'Complete' ) as completed_count,
  (SELECT COUNT(*)  FROM learning.LEARNING_INTERNAL_TRAINING t4 WHERE I.item_id  = t4.item_id  AND t4.completion_status_descr = 'Incomplete' ) as incomplete_count 
from learning.LEARNING_INTERNAL_TRAINING I;
