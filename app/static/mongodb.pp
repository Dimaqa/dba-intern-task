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
  unless => ["cat /etc/mongodb.conf | grep 'bind_ip = 0.0.0.0'"],
  notify => Service['mongodb']
}
exec { 'add admin user':
  command => "mongo <<EOF
  use admin;
  db.createUser({user:'root', pwd:'secretpwd', roles: [{role:'root', db:'admin'}]})",
  path => '/usr/bin/',
  notify => Service['mongodb']
}
