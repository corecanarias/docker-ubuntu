FROM ubuntu:raring
MAINTAINER corecanarias

RUN apt-get update

# Install basic packages.
RUN apt-get install -y dialog
RUN apt-get install -y curl git htop unzip vim wget supervisor dnsmasq

# ssh
RUN apt-get install -y openssh-server
RUN mkdir /root/.ssh
RUN mkdir -p /var/run/sshd

#Supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Set working directory.
ENV HOME /root
WORKDIR /root

EXPOSE 22
CMD ["/usr/bin/supervisord"]
