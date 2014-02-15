FROM ubuntu:raring
MAINTAINER corecanarias

RUN apt-get update

# Install basic packages.
RUN apt-get install -y dialog
RUN apt-get install -y software-properties-common
RUN apt-get install -y curl git htop unzip vim wget

# Puppet
RUN wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
RUN dpkg -i puppetlabs-release-precise.deb
RUN rm puppetlabs-release-precise.deb

RUN apt-get install -y puppet-common
RUN apt-get install -y puppet

# Set working directory.
ENV HOME /root
WORKDIR /root
