class java {}

class java::oracle inherits java {

  file { "/tmp/jdk-6u25-linux-i586.rpm":
    ensure => present,
    source => 'puppet:///files/jdk-6u25-linux-i586.rpm',
  }

  package { "jdk-6u25-linux-i586":
    ensure   => present,
    provider => rpm,
    source   => '/tmp/jdk-6u25-linux-i586.rpm',
  }

  notify { "Installing Oracle Java JDK": }

}
