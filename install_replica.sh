sudo service mongodb stop
sudo mongod --port 27017 --dbpath /var/lib/mongodb/ --replSet rs0 --bind_ip localhost
echo "rs.initiate()" | /usr/bin/mongo