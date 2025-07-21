WITH BIKE as (

select
distinct
START_STATION_ID,
start_station_name,
start_latitude,
start_longitude

from {{ ref('stg_bike') }}

where RIDE_ID != '"bikeid"'


)

select
*
from BIKE