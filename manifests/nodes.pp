import 'base'
import 'puppet'
import 'ssh'
import 'users'
import 'nexus'
import 'mysql'

$puppetmaster_host     = 'mgmt.muda.no'
$puppetmaster_manifest = '/etc/puppet/manifests/site.pp'

node default {
  include ssh
  include git
  include timezone
  include users::admins
  include puppet::agent
  include mysql::client
}

node 'node1.muda.no' inherits default {
  include users::deployers
}

node 'node2.muda.no' inherits default {
  include users::deployers
  include java::oracle
}

node 'db1.muda.no' inherits default {
  include users::deployers
  include mysql::server
}


node 'mgmt.muda.no' inherits default {
  include java::oracle
  include puppet::master
  include sonatype::nexus
}