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
    require => User['oc'],
  }

  file { '/home/stein/.ssh':
    ensure => "directory",
    mode   => 600,
    owner  => 'stein',
    require => User['stein'],
  }

}

class users::deployers inherits users {
  group { 'deploy': ensure => present, gid => 2000 }

  user  { 'roots':
    ensure => present,
    uid => 2000,
    gid => 2000,
    comment => 'ROOTS Deployment User',
    shell   => "/bin/bash",
    home    => "/srv/roots",
    managehome => true,
  }

  file { '/srv/roots/.ssh':
    ensure  => "directory",
    mode    => 600,
    owner   => 'roots',
    require => User['roots'],
  }

  file { '/srv/roots/authorized_keys':
    ensure => present,
    mode   => 644,
    source => "puppet:///modules/users/authorized_keys",
    require => File['/srv/roots/.ssh'],
  }
}
