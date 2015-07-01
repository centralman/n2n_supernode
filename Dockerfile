# Use ubuntu:14.04 as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See hub.docker.com ubuntu for
# a list of version numbers.

FROM ubuntu:14.04
MAINTAINER siuyin@beyondbroadcast.com

# Set correct environment variables.
ENV HOME /home/app/supernode
ENV SUPERNODE_UDP_PORT 53
RUN mkdir -p /home/app/supernode/
COPY supernode /home/app/supernode/supernode

# Execute the following command by default
CMD ["/bin/sh","-c", "/home/app/supernode/supernode -l $SUPERNODE_UDP_PORT  -f -v"]


# ...put your own build instructions here...
# install development headers for postgresql client
#RUN apt-get update
#RUN apt-get install runit -y


# setup runit service
#RUN mkdir -p /etc/service/supernode
#ADD run /etc/service/supernode/run

EXPOSE 53/udp

## Install an SSH key
#ADD config/id_rsa.pub /tmp/your_key
#RUN cat /tmp/your_key >> /root/.ssh/authorized_keys && rm -f /tmp/your_key

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

