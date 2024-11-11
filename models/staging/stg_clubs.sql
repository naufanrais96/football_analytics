with 
clubs_raw as (
    select
        club_id,
        club_code,
        name
    from {{ source("football_analytics_sources", "clubs")}}
)

select *
from clubs_raw