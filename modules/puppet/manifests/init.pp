class puppet::agent {
  file {
    "/etc/sysconfig":
      ensure => directory,
  }
  file {
    "/etc/sysconfig/puppet":
      source => "puppet:///modules/puppet/templates/puppet.erb",
      require => [ Package[puppet], File['/etc/sysconfig'] ],
  }

  package { 'puppet':
      ensure => present,
  }
}

class puppet::master {

  include puppet::agent

  file {
    "/etc/sysconfig/puppetmaster":
      source => "puppet:///modules/puppet/templates/puppetmaster.erb",
      require => [ Package[puppet], Package[puppet-server] ]
  }
  package { 'puppet-server':
      ensure => present,
  }
}