exec { 'run as replica':
  command => 'echo replSet="rs0" | /usr/bin/tee -a /etc/mongodb.conf && echo "rs.initiate()" | /usr/bin/mongo',
  path => '/bin',
  unless => ["cat /etc/mongodb.conf | grep 'replSet='"],
  notify => Service['mongodb']
}
