with
games_raw as (
    select
        game_id,
        competition_id,
        date,
        home_club_id,
        away_club_id,
        home_club_goals,
        away_club_goals
    from {{ source('football_analytics_sources', 'games')}}
)

select *
from games_raw