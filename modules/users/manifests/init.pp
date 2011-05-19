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

  file { '/home/oc/.ssh':
    ensure => "directory",
    mode   => 600,
    owner  => 'oc',
    gid    => '10',
  }

  file { '/home/stein/.ssh':
    ensure => "directory",
    mode   => 600,
    owner  => 'stein',
    gid    => '10',
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

  #ssh::auth::server { ['oc', 'stein']: user => 'bekk' }
}