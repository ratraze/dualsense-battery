#!/bin/sh

iconGamepad=""
iconFailure=""
iconCharging=""

if [ -f "/usr/bin/dualsensectl" ]; then
  output=$(dualsensectl battery 2>/dev/null)

  if [[ -n $output ]]; then

    if [[ $output -eq 100 ]]; then
      echo $iconCharging && exit 0
    fi
    printf "%s %s%%" $iconGamepad $output 

  else echo $iconFailure 
  fi
else echo "Dualsensectl is not found"
fi
