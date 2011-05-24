class java {
  include java::oracle::oc
}

# Install from remote source (RPM)
class java::oracle::oc {
  package { "jdk-6u25-linux-i586":
    ensure   => present,
    provider => rpm,
    source   => 'http://oc.rynning.no/jdk-6u25-linux-i586.rpm',
  }
}

# Download official, unpack RPMs from binary
class java::oracle::official inherits java {

  file { '/etc/puppet/files/jdk-6u25-linux-i586.rpm':
    ensure => present,
    requires => [File['/etc/puppet/files/jdk-6u25-linux-i586-rpm.bin'], Exec["Unpack RPMs"]]
  }

  file { '/etc/puppet/files/jdk-6u25-linux-i586-rpm.bin':
    ensure => present,
    requires => Exec["Fetch JDK"]
  }

  exec { 'Fetch JDK':
    command => "wget http://download.oracle.com/auth/otn-pub/java/jdk/6u25-b06/jdk-6u25-linux-i586-rpm.bin",
    creates => '/etc/puppet/files/jdk-6u25-linux-i586-rpm.bin',
    path    => ["/usr/bin", "/bin"],
  }

  exec { 'Unpack RPMs':
    command => "sh /etc/puppet/files/jdk-6u25-linux-i586-rpm.bin | echo \"\"",
    creates => '/etc/puppet/files/jdk-6u25-linux-i586.rpm',
    path    => ["/usr/bin", "/bin"],
  }

  package { "jdk-6u25-linux-i586":
    ensure   => present,
    provider => rpm,
    source   => '/tmp/jdk-6u25-linux-i586.rpm',
  }

}

# Provision through puppet example (requires /tmp file)
class java::oracle::puppet inherits java {

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
