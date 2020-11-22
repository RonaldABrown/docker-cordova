FROM debian:latest

RUN apt-get update && apt-get install -y git npm
RUN npm install -g cordova
RUN echo "Here I am" >/.message

