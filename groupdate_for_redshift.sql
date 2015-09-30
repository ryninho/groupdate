-- day w/ time zone


CREATE OR REPLACE FUNCTION gd_week(timestamp TIMESTAMP, time_zone_name TEXT)
    RETURNS TIMESTAMP
STABLE
AS $$
    from datetime import datetime
    import pytz
    from pytz import timezone
    if timestamp.tzinfo is None:
      timestamp = timestamp.replace(tzinfo=pytz.utc)
    local_tz = timezone(time_zone_name)
    local_time = timestamp.astimezone(local_tz)
    local_date = local_time.replace(hour=0, minute=0, second=0, microsecond=0)
    return local_date.replace(tzinfo=None)
$$ LANGUAGE plpythonu;

