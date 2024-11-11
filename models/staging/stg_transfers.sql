with
transfers_raw as (
    select
        transfer_date,
        player_id,
        transfer_season,
        from_club_id,
        to_club_id,
        transfer_fee,
        market_value_in_eur
    from {{ source{'football_analytics_sources', 'transfers'}}}
)

select *
from transfers_raw