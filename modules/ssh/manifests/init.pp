class ssh {
  $port = 22
  $allow_users = []
  file {
    "/etc/ssh":
      ensure => directory,
      mode => 0755, owner => root, group => root,
  }
  file {
    "/usr/bin/ssh-agent":
      group => ssh,
      require => Package[openssh-client];
  }
  user {
    sshd:
      uid => 74, gid => 74,
      home => "/var/empty/sshd",
      shell => "/sbin/nologin",
      allowdupe => false,
  }
  group {
    sshd:
      gid => 74,
      allowdupe => false,
  }
  package {
    "openssh-client":
      ensure => installed,
      require => [ File["/etc/ssh"], Group[sshd] ],
  }
  package {
    "openssh-server":
      ensure => installed,
      require => [ File["/etc/ssh"], User[sshd], Group[sshd] ],
  }
  service {
    ssh:
      ensure => running,
      pattern => "sshd",
      require => Package["openssh-server"],
      subscribe => [ File["/etc/ssh"], User[sshd], Group["sshd"] ],
  }
}