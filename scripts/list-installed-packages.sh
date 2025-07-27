#!/bin/bash

read -rp "Specify the date [YYYY-MM-DD] " date
comm -12 <(pacman -Qqe | sort) <(
    awk -v date="$date" '
    /\[ALPM\] installed/ {
      gsub(/[\[\]]/, "", $1)
      split($1, d, "T")
      if (d[1] >= date) print $(NF-1)
    }
  ' /var/log/pacman.log | sort
)
