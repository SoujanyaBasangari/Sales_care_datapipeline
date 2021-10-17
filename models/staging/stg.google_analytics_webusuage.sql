with source as (
  select * from salesdata.google_analytics_webusuage
),

stage_google_analytics_webusuage as (
  select
    shop,
    channel,
    date,
    sessions,
    bounces,
    page_views,
    users,
    new_users
  from source
)
select
  *
from stage_google_analytics_webusuage 

