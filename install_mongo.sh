#!/bin/sh
# install dirmgr to add public key
sudo apt-get install -y dirmngr
# import public key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
# create source link
echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
# reload packages with new source
sudo apt-get update
# install mongo
sudo apt-get install -y mongodb-org
# replace bind_ip to 0.0.0.0 to open mongodb to the world
sudo sed -i 's/bind_ip.*/bind_ip = 0.0.0.0/g' /etc/mongodb.conf
# create admin, is it ok way to create same password for everyone?
/usr/bin/mongo <<EOF
use admin;
db.createUser({user:'root', pwd:'secretpwd', roles: [{role:'root', db:'admin'}]})
EOF
sudo service mongodb restart