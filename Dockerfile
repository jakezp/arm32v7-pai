FROM arm32v7/ubuntu:latest

LABEL maintainer="Jakezp <jakezp@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

# Update and install packages
RUN apt-get update \
    && apt-get install -y curl supervisor git \
    && apt autoremove -y \
    && apt-get update \
    && apt-get install -y python3 python3-setuptools \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && curl https://bootstrap.pypa.io/get-pip.py | python3

# Add config files
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD run.sh /run.sh

# Set permissions
RUN chmod +x /run.sh

# Expose volumes & ports
VOLUME ["/opt/paradox"]

WORKDIR /root/
CMD ["/run.sh"]
