with source as (
  select * from salesdata.shopify_data      
),

stage_shopify_data as (
  select
    order_id,
    customer_id,
    created_at,
    currency,
    transaction_id,
    shop,
    test,
    total_gross_revenue,
    total_tax
  from source
)
select
  *
from stage_shopify_data 

     