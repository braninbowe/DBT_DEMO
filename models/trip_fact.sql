WITH TRIPS as
(

select 
RIDE_ID,
RIDEABLE_TYPE,
DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
start_station_id,
end_station_id,
member_or_casual_ride,
TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS

from {{ source('demo', 'bike') }}

where RIDE_ID != 'ride_id'

limit 10

)

select *
from TRIPS