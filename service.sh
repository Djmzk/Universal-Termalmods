sleep 60

stop logd

sleep 10

for thermal in $(resetprop | awk -F '[][]' '/thermal/ {print $2}'); do
  if [[ $(resetprop "$thermal") == running ]] || [[ $(resetprop "$thermal") == restarting ]]; then
    stop "${thermal/init.svc.}"
    sleep 10
    resetprop -n "$thermal" stopped
  fi
done

sleep 10

find /sys/devices/virtual/thermal -type f -exec chmod 000 {} +
