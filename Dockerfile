FROM ubuntu:14.04

# Upgrade the container
RUN apt-get -y update
RUN apt-get -y upgrade 

# Setup user for the engine
RUN groupadd battleline
RUN useradd battleline -s /bin/bash -m -g battleline
WORKDIR /home/battleline

# Get the latest version of the engine
RUN apt-get -y install git python2.7
RUN git clone --depth 1 https://jonathanhood@bitbucket.org/patrick_viafore/battlelineaiengine.git
RUN chown -R battleline:battleline /home/battleline

# Add the engine runner
ADD run.sh /home/battleline/run.sh

# Install Scala Dependencies
RUN apt-get -y install openjdk-7-jre-headless


USER battleline
CMD "./run.sh"

