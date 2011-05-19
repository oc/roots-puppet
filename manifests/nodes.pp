import 'base'
import 'puppet'
import 'ssh'
import 'users'
import 'git'
import 'nexus'

$puppetmaster_host     = 'mgmt.muda.no'
$puppetmaster_manifest = '/etc/puppet/manifests/site.pp'

node default {
  include ssh
  include timezone
  include users::admins
  include puppet::agent
}

node 'roots1.muda.no' inherits default {
  include users::deployers
}

node 'roots2.muda.no' inherits default {
  include users::deployers
  include oracle::java
}

node 'mgmt.muda.no' inherits default {
  include puppet::master
  include sonatype::nexus
}