#!/bin/bash
let COUNT=75
while [ $COUNT -gt 0 ]; do
        mosquitto_pub -t "house" -h iot.eclipse.org -m "$COUNT"
        let COUNT=(COUNT-1)
done
