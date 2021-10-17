with source as (
  select * from salesdata.marketing_costs
),

stage_marketing_costs as (
  select
    date,
    shop,
    channel,
    costs
  from source
)
select
  *
from stage_marketing_costs 


