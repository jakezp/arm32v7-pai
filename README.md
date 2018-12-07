# Paradox Alarm Interface for Magellan
## created by jpbarraca (https://github.com/jpbarraca/pai)

Paradox Alarm Interface for Magellan created by jpbarraca (https://github.com/jpbarraca/pai).<br> Middleware that aims to connect to a Paradox Alarm panel, exposing the interface for monitoring and control via several technologies. With this interface it is possible to integrate Paradox panels with HomeAssistant, OpenHAB, Homebridge or other domotics system that supports MQTT, as well as several IM methods.
<p>
Docker image to automate installation and running in direct IP connection with MQTT enabled. The application is started and managed by supervisor.
<p>
Requires a configured MQTT server to run. Configure config/user.py to suite your environment.

# Run with:
```
docker run -d --name='pai' --network bridge \
    -v '/docker-data/pai/app':'/opt/paradox':'rw' \
    -e TZ="Africa/Johannesburg" \
     jakezp/arm32v7-pai:latest
```
<p>
Requires a configured MQTT server to run. There are many other options that can be tweaked - check config/defaults.py for options and add these options to be changed to /tmp/pai/config/pai/config/user.py. 
<p>
Restart pai with:

```
docker exec pai /usr/bin/supervisorctl restart pai
```

# Resources:
    Dockerfile - Build docker image
    README.md - This file
    rpi-pai.service - systemd file to auto start docker
    run.sh - Start the service
    supervisord.conf - Supervisor config
<p>
    
# RPI Image
This repo is for creating a docker image for Raspberry PI
    
# Dockerhub
https://hub.docker.com/r/jakezp/arm32v7-pai/

