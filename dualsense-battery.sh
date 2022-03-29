#!/bin/sh

iconGamepad=""
iconFailure=""
iconCharging=""

if [ -f "/usr/bin/dualsensectl" ]; then
  output=$(dualsensectl battery 2>/dev/null)

  if [[ $output =~ ^([0-9]{1,3})( {1}[a-z].*)?$ ]]; then
    charge=${BASH_REMATCH[1]}
    batteryStatus=${BASH_REMATCH[2]}
    batteryStatusText=""

    if [[ "$batteryStatus" == " charging" ]]; then
      batteryStatusText=$iconCharging
    fi

    printf "%s %s%% %s" $iconGamepad $charge $batteryStatusText 

  else echo $iconFailure 
  fi
else echo "Dualsensectl is not found"
fi
