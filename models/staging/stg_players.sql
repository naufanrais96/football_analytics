with players_raw as (
    select
        player_id,
        name,
        current_club_id,
        position,
        sub_position
    from {{ source('football_analytics_sources', 'players')}}
)

select *
from players_raw