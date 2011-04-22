# This is mainly for documenting the puppetmaster setup.
class puppetmaster {

  package { puppetmaster:
    ensure => present,
  }

  file { "/etc/sysconfig":
    ensure => directory,
  }

  file { "/etc/sysconfig/puppetmaster":
    source => "puppet:///files/etc/sysconfig/puppetmaster",
    require => Package[puppetmaster],
  }
}