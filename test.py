
def gd_day(timestamp, time_zone_name):
  from datetime import datetime
  import pytz
  from pytz import timezone
  if timestamp.tzinfo is None:
    timestamp = timestamp.replace(tzinfo=pytz.utc)
  local_tz = timezone(time_zone_name)
  local_time = timestamp.astimezone(local_tz)
  local_date = local_time.replace(hour=0, minute=0, second=0, microsecond=0)
  return local_date.replace(tzinfo=None)


from datetime import datetime
#answer = gd_day(datetime.utcnow(), 'US/Eastern')
#print answer


print gd_day(datetime.strptime('2015-09-30 04:40:48', '%Y-%m-%d %H:%M:%S'), 'America/Los_Angeles')

