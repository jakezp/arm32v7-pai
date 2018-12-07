#!/bin/bash
# Install pai

if [[ -f /opt/paradox/config/user.py ]]; then
  mv /opt/paradox/config/user.py /root/user.py
  rm -rf /opt/paradox
  git clone https://github.com/jpbarraca/pai.git /opt/paradox
  pip3 install -r /opt/paradox/requirements.txt
  sleep 30
  mv /root/user.py /opt/paradox/config/user.py
  mkdir -p /opt/paradox/logs/
else
  rm -rf /opt/paradox
  git clone https://github.com/jpbarraca/pai.git /opt/paradox
  pip3 install -r /opt/paradox/requirements.txt
  sleep 30
  cp /opt/paradox/config/user.py.sample /opt/paradox/config/user.py
  mkdir -p /opt/paradox/logs/
fi

# Temp fix to enable support for home-assistant
sed -i "s/ARM_AWAY='arm'.*/armed_home='arm_stay', armed_away='arm', armed_sleep='arm_sleep', disarmed='disarm')/g" /opt/paradox/paradox/interfaces/mqtt_interface.py
sed -i "s/alarm='triggered', stay_arm='armed_away', arm='armed_away', sleep_arm='armed_home', disarm='disarmed')/alarm='triggered', stay_arm='armed_home', arm='armed_away', sleep_arm='armed_sleep', disarm='disarmed')/g" /opt/paradox/paradox/interfaces/mqtt_interface.py

# Use supervisord to start all processes
echo -e "Starting supervisord"
supervisord -c /etc/supervisor/conf.d/supervisord.conf
