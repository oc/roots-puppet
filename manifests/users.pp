# implicit param $name
define create_user($group => "$name", $userhome => "/home/$name", $shell => "/bin/bash", $comment => "$fullname") {
  user { $name:
    ensure  => present,
    comment => "$comment",
    shell   => "/bin/bash",
    home    => "$userhome"
  }

  group { $group:
    ensure => present,
  }

  exec { "$name userhome":
    command => "/bin/cp -R /etc/skel $userhome; /bin/chown -R $name:$name $userhome",
    creates => "$userhome",
    require => User[$name],
  }

  file { "$userhome":
    ensure  => directory,
    owner   => "$name",
    group   => "$group",
    mode    => 700,
    require => Exec["$name userhome"]
  }
}

create_user { 'bekk': userhome => '/u01/bring' }
create_user { 'oc':   group => 'staff' }
create_user { 'steininge': group => 'staff' }
