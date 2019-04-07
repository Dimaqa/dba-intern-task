echo 'replSet="rs0"' | sudo tee -a /etc/mongodb.conf
echo "rs.initiate()" | /usr/bin/mongo
service mongodb restart