select t.* except (prnk)
from (select t.*, percent_rank() over(order by distinct_id) prnk from {{ref('user_events')}} t) t
where prnk <= 0.8