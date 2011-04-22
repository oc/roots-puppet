# This is mainly for documenting the puppet slave setup.
class puppet {
  package { puppet:
    ensure => present,
  }

  file { "/etc/sysconfig":
    ensure => directory,
  }

  file { "/etc/sysconfig/puppet":
    source => "puppet:///files/etc/sysconfig/puppet",
    require => Package[puppet],
  }
}