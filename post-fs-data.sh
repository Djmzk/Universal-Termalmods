directory=/data/adb/modules/RTU/

if [[ ! -d /data/adb/modules/RTU/system ]]; then

  find /system/ -name "*thermal*" | while read -r thermal; do

    if [[ $(echo "$thermal" | grep "\.conf") ]]; then
      mkdir -p "${directory}/${thermal}"
      rmdir "${directory}/${thermal}"
      touch "${directory}/${thermal}"
    fi

  done

  find /vendor/ -name "*thermal*" | while read -r thermal; do

    if [[ $(echo "$thermal" | grep "\.conf") ]]; then
      mkdir -p "${directory}/system/${thermal}"
      rmdir "${directory}/system/${thermal}"
      touch "${directory}/system/${thermal}"
    fi

  done

fi