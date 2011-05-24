class nexus {

  $nexus_bundle = "/etc/puppet/files/nexus-oss-webapp-1.9.1.1-bundle.tar.gz"

  file { "/opt/nexus-oss-webapp-1.9.1.1":
    require => Exec["Extract nexus"],
  }

  exec { "Extract nexus":
    cwd     => "/opt",
    command => "tar xvf $nexus_bundle",
    creates => '/opt/nexus-oss-webapp-1.9.1.1',
    path    => ["/usr/bin", "/bin"],
  }

  file { "/opt/nexus":
    ensure  => link,
    target  => "/opt/nexus-oss-webapp-1.9.1.1",
    require => File['/opt/nexus-oss-webapp-1.9.1.1'],
  }

  file { "/etc/init.d/nexus":
    ensure  => link,
    target  => "/opt/nexus/bin/jsw/linux-x86-32/nexus",
    require => File['/opt/nexus-oss-webapp-1.9.1.1'],
  }

  service { 'nexus': enable  => true, }

}
