# implicit param $name
user { 'oc':
  ensure  => present,
  uid     => 1337,
  gid     => '10',
  comment => 'Ole Christian Rynning',
  shell   => "/bin/bash",
  home    => "/home/oc",
  managehome => true,
}

group { 'bekk': ensure => present, gid => 2000 }

user  { 'bekk':
  ensure => present,
  uid => 2000,
  gid => 2000,
  comment => 'BEKK Deployment User',
  shell   => "/bin/bash",
  home    => "/u01/bring",
  managehome => true,
}
