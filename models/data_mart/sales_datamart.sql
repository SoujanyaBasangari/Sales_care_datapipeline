
with marketing_costs as (
  select
    *
  from {{ ref('stage_marketing_costs') }}
),

google_analytics_transcation as (
  select
    *
  from {{ ref('stage_google_analytics_transcation') }}
),

google_analytics_webusuage as (
  select
    *
  from {{ ref('stage_google_analytics_webusuage') }}
),

shopify_data as (
  select
    *
  from {{ ref('stage_shopify_data') }}
),

sales_datamart as (
  select
    order_id,
    customer_id,
    t.channel,
    s.created_at as shopify_created_at,
    currency,
    s.transcation_id as shopify_transcation_id,
    s.shop,
    test,
    total_gross_revenue,
    total_tax,
    t.transcation_id as analytics_transaction,
    t.created_at as analytical_created_at,
    country,
    compaign,
    date as analtics_date,
    sessions,
    bounces,
    page_views,
    users,
    new_users,
    m.date as m_date,
    costs as costs
      from shopify_data s
      inner join google_analytics_transcation t on s.shop= t.shop 
      inner join google_analytics_usage u on s.shop= t.shop and t.channel = a.channel
      inner join marketing_costs m on s.shop=m.shop and t.channel = m.channel
    )
  select
    *
  from sales_datamart 