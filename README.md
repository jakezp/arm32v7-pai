# Paradox Alarm Interface for Magellan - created by jpbarraca (https://github.com/jpbarraca/pai)

## RPI Image

Paradox Alarm Interface for Magellan created by jpbarraca (https://github.com/jpbarraca/pai).<br> Middleware that aims to connect to a Paradox Alarm panel, exposing the interface for monitoring and control via several technologies. With this interface it is possible to integrate Paradox panels with HomeAssistant, OpenHAB, Homebridge or other domotics system that supports MQTT, as well as several IM methods.
<br>
I've created the docker image to automate installation and running in direct IP connection with MQTT enabled. The application is started and managed by supervisor.
<br>
Requires a configured MQTT server to run. Configure config/user.py to suite your environment.

# Run with:
```
docker run -d --name='pai' --net='bridge' --privileged \
    -v '/tmp/pai/config':'/opt/paradox' \
    jakezp/arm32v7-pai
```
<p>
Requires a configured MQTT server to run. There are many other options that can be tweaked - check /tmp/pai/config/pai/config/defaults.py for options and add these options to be changed to /tmp/pai/config/pai/config/user.py. Restart pai with:

```
docker exec pai /usr/bin/supervisorctl restart pai
```
This image is created to run on Raspberry PI.

