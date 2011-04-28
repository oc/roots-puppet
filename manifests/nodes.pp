import 'base'
import 'puppet'
import 'ssh'
import 'users'

node default {
  include ssh
  include users
  include timezone
  $puppetmaster_host = 'mgmt.muda.no'
  include puppet
}

node 'roots1.muda.no' inherits default {
}

node 'roots2.muda.no' inherits default {
}

node 'mgmt.muda.no' inherits default {
  $puppetmaster_manifest = '/etc/puppet/manifests/site.pp'
  include puppet::master
}