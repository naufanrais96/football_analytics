#Players Data Mart

with 
players as (
  select *
  from `dbt-project-417804.football_analytics.players`
),
clubs as (
  select *
  from `dbt-project-417804.football_analytics.clubs`
),
player_valuations as (
  select *
  from `dbt-project-417804.football_analytics.player_valuations`
),

valuation_changes as (
SELECT 
  player_id, 
  date market_update_date,
  lag(date) over(partition by player_id order by date) market_update_prev_date,
  market_value_in_eur market_value, 
  lag(market_value_in_eur) over(partition by player_id order by date) market_value_prev,
FROM player_valuations
)

select distinct
  player_id,
  coalesce(concat(first_name," ",last_name), first_name, last_name) player_name,
  position,
  sub_position,
  d.club_code club_code,
  market_update_date latest_market_update_date,
  market_value,
  rank() over(order by market_value desc) rn_market_value,
  market_value - market_value_prev,
  rank() over(order by market_value - market_value_prev desc) rn_market_value_changes
from players c
join valuation_changes a using(player_id)
join (select player_id, max(market_update_date) market_update_date from valuation_changes group by 1) b using(player_id, market_update_date) 
join clubs d on c.current_club_id = d.club_id
order by 9 desc
