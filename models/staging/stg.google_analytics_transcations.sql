with source as (
  select * from salesdata.google_analytics_transcations
),

stage_google_analytics_transcations as (
  select
    shop,
    channel,
    created_at,
    compaign,
    country,
    transcation_id
  from source
)
select
  *
from stage_google_analytics_transcations 

