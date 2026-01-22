#!/bin/sh

# Attendre qu'InfluxDB soit prêt
until curl -s http://influxdb2:8086/health | grep "pass" > /dev/null;do
  echo "Waiting for InfluxDB to be ready..."
  sleep 2

done

exec telegraf --config /etc/telegraf/telegraf.conf