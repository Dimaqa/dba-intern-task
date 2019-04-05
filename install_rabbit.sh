#!/bin/sh
# enable rabbitmq repo and add verificaton key
echo "deb https://dl.bintray.com/rabbitmq/debian stretch main" | sudo tee /etc/apt/sources.list.d/bintray.rabbitmq.list
curl http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add -
# update with new sources
sudo apt-get update -y
# install rabbitmq
sudo apt-get install -y rabbitmq-server