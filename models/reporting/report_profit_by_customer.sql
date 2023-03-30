select 
customerid,
segment,
country ,
sum(profit) as profit
from {{ ref('stg_orders') }}
group by 
customerid,
segment,
country 
