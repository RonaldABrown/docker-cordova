FROM debian:10.6

ARG VERSION=14

# Update the package cache and install required packages
RUN apt-get update
RUN apt-get install -y git wget gnupg

# Set up the nodesource PPA to get recent version of node
RUN wget --quiet -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | \
    apt-key add -
RUN echo "deb https://deb.nodesource.com/node_$VERSION.x buster main" | \
    tee /etc/apt/sources.list.d/nodesource.list
RUN echo "deb-src https://deb.nodesource.com/node_$VERSION.x buster main" | \
    tee -a /etc/apt/sources.list.d/nodesource.list

# Install node and npm from PPA
RUN apt-get update
RUN apt-get install -y nodejs

# Install Cordova
RUN npm install -g cordova browserify uglify-js
RUN cordova telemetry off

RUN mkdir -p /cordova
WORKDIR /cordova
