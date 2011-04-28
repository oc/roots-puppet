import 'base'
import 'puppet'
import 'ssh'
import 'users'
import 'git'

$puppetmaster_host     = 'mgmt.muda.no'
$puppetmaster_manifest = '/etc/puppet/manifests/site.pp'

node default {
  include ssh
  include users
  include timezone
  include puppet::agent
}

node 'roots1.muda.no' inherits default {
}

node 'roots2.muda.no' inherits default {
  include git
}

node 'mgmt.muda.no' inherits default {
  include puppet::master
}