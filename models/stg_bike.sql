WITH BIKE AS (

select
RIDE_ID,
REPLACE(STARTED_AT,'"','') AS STARTED_AT,
REPLACE(ENDED_AT,'"','') AS ENDED_AT,
START_STATION_NAME,
START_STATION_ID,
END_STATION_NAME,
END_STATION_ID,
start_latitude,
start_longitude,
end_latitude,
end_longitude,
member_or_casual_ride

from {{ source('demo', 'bike') }}

where RIDE_ID not in ('"bikeid"', '""bikeid""') 
  and STARTED_AT not in ('"starttime"', 'starttime', '""starttime""')
)

select
*
from BIKE