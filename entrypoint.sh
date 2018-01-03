echo "Pushbullet-Reboot v$(cat /VERSION)"

if [ -z "$TZ" ]; then
  echo "# TZ: No timezone specified"
else
  echo "# TZ provided: $TZ"
  cp "/usr/share/zoneinfo/$TZ" /etc/localtime
  echo "$TZ" >  /etc/timezone
  echo "# Date: $(date)"
fi

if [ -z "$PB_API_KEY" ]; then
  echo "# PB_API_KEY: ERROR no API key provided, exiting"
  exit 1
else
  echo "# PB_API_KEY provided: $PB_API_KEY"
fi

curl  --header "Access-Token: $PB_API_KEY" \
      --header 'Content-Type: application/json' \
      --data-binary "{\"body\":\"$MSG_BODY $(date)\",\"title\":\"$MSG_TITLE\",\"type\":\"note\"}" \
      --request POST https://api.pushbullet.com/v2/pushes