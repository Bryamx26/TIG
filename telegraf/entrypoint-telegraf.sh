#!/bin/sh

# Attendre qu'InfluxDB soit prêt
until curl -s http://influxdb2:8086/health | grep "pass"; do
  echo "Waiting for InfluxDB to be ready..."
  sleep 2
done

# Lancer Telegraf
exec telegraf --config /etc/telegraf/telegraf.conf
