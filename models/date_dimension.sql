WITH CTE AS 
(
select
     TO_TIMESTAMP(STARTED_AT) as STARTED_AT,
     DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED,
     HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED,
 
     {{day_type('STARTED_AT')}} AS DAY_TYPE,

     {{get_season('STARTED_AT')}} AS SEASON_OF_YEAR,

     DAYNAME(TO_TIMESTAMP(STARTED_AT)) AS DAY_OF_WEEK


from
{{ source('demo', 'bike') }}
where STARTED_AT != 'started_at'
)

select * from CTE