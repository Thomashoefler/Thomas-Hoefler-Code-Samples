/* Developer: Thomas Hoefler
COMMENT: 

REQUIREMENTS: list all the employees, courses and completion dates for internal and external learning for the current year
*/
select innerpart.*
from
(select user_id, item_descr, completion_date_item
from learning.LEARNING_INTERNAL_TRAINING
union all
select user_id, external_event_name as item_descr, external_event_comp_date as completion_date_item 
from learning.learning_external_training ) as innerpart
where year(innerpart.completion_date_item) = year(current_date);
