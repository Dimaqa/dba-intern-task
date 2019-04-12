echo 'replSet="rs0"' | sudo tee -a /etc/mongodb.conf
service mongodb restart
echo "rs.initiate()" | /usr/bin/mongo
