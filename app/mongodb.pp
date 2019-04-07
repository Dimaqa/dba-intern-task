package { 'mongodb':
  ensure => 'installed',
}
service {'mongodb':
  ensure => 'running',
  enable => true,
}
exec { 'open server to internet':
  command => "sed -i 's/bind_ip.*/bind_ip = 0.0.0.0/g' /etc/mongodb.conf",
  path => '/bin',
  notify => Service['mongodb']
}
exec { 'add admin user':
  command => "mongo <<EOF
  use admin;
  db.createUser({user:'root', pwd:'secretpwd', roles: [{role:'root', db:'admin'}]})",
  path => '/usr/bin/',
  notify => Service['mongodb']
}
exec { 'run as replica':
  command => 'echo replSet="rs0" | /usr/bin/tee -a /etc/mongodb.conf && echo "rs.initiate()" | /usr/bin/mongo',
  path => '/bin',
  notify => Service['mongodb']
}
