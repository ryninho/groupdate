-- day w/ time zone


CREATE OR REPLACE FUNCTION gd_day(timestamp_col TIMESTAMP, time_zone_name TEXT)
    RETURNS TIMESTAMP
STABLE
AS $$
    from datetime import datetime
    import pytz
    from pytz import timezone
    if timestamp_col.tzinfo is None:
      timestamp_col = timestamp_col.replace(tzinfo=pytz.utc)
    local_tz = timezone(time_zone_name)
    local_time = timestamp_col.astimezone(local_tz)
    local_date = local_time.replace(hour=0, minute=0, second=0, microsecond=0)
    return local_date.replace(tzinfo=None)
$$ LANGUAGE plpythonu;

