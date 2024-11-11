with
stg_dim_players as (
    select
        player_id,
        name full_name,
        current_club_id club_id,
        position main_position,
        sub_position
    from {{ ref('stg_players')}}
)

select *
from stg_dim_players