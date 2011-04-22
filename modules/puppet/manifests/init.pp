class puppet {
  file {
    "/etc/sysconfig":
      ensure => directory,
  }
  file {
    "/etc/sysconfig/puppet":
      source => "puppet:///files/etc/sysconfig/puppet",
      require => Package[puppet],
  }
  package {
    puppet:
      ensure => present,
  }
}

class puppet::master inherits puppet {
  file {
    "/etc/sysconfig":
      ensure => directory,
  }
  file {
    "/etc/sysconfig/puppetmaster":
      source => "puppet:///files/etc/sysconfig/puppetmaster",
      require => Package[puppetmaster],
  }
  package {
    puppetmaster:
      ensure => present,
  }
}