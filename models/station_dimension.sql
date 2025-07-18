WITH BIKE AS
(

select
distinct
start_station_id,
start_station_name,
start_latitude,
start_longitude

from {{ source('demo', 'bike') }}
WHERE RIDE_ID != 'ride_id'

-- limit 10
)

select * from BIKE