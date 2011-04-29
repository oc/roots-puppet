# implicit param $name

class users {}

class users::admins inherits users {
  user { 'oc':
    ensure  => present,
    uid     => 1337,
    gid     => '10',
    comment => 'Ole Christian Rynning',
    shell   => "/bin/bash",
    home    => "/home/oc",
    managehome => true,
  }

  user { 'stein':
    ensure  => present,
    uid     => 1001,
    gid     => '10',
    comment => 'Stein Inge Morisbak',
    shell   => "/bin/bash",
    home    => "/home/stein",
    managehome => true,
  }

}

class users::deployers inherits users {
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
}