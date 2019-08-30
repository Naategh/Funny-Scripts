#!/bin/bash

echo "Colorful Date :)" | toilet -f mini --gay
sleep 0.9
while true; do
  echo "$(date '+%D %T' | toilet -f term -F border --gay)"
  sleep 1
done
