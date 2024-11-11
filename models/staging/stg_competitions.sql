with
competitions_raw as (
    select
        competition_id,
        competition_code,
        name,
        type
    from {{ source("football_analytics_sources", "competitions")}}
)

select *
from competitions_raw