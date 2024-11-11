with
player_valuations_raw as (
    select
        date,
        player_id,
        current_club_id,
        market_value_in_eur
    from {{ source('football_analytics_sources', 'player_valuations')}}
)

select *
from player_valuations_raw