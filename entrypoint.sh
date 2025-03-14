#!/bin/sh
set -e  # Exit on error

exec ./Tools/autotest/sim_vehicle.py \
  -v "$VEHICLE_TYPE" \
  --frame "$FRAME" \
  --console \
  --mavproxy-args="--out $CONNECTION_TYPE:$REMOTE_IP:$PORT" \
  -w \
  -l "$LAT,$LON,$ALT,$HEADING" \
  $NON_INTERACTIVE
