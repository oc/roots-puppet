import 'base'
import 'puppet'
import 'ssh'

node default {
  include ssh
  $puppetmaster_host = 'mgmt.muda.no'
  include puppet
}

node "roots1.muda.no" inherits default {
}

node "roots2.muda.no" inherits default {
}

node "mgmt.muda.no" inherits default {
  $puppetmaster_manifest = '/etc/puppet/site/manifests/site.pp'
  include puppet::master
}