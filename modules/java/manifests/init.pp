#class java {
#  package{
#    ['jpackage-utils']:
#    ensure => present,
#  }
#  package{
#    ['java-1.6.0-sun', 'java-1.6.0-sun-devel', 'java-1.6.0-sun-fonts']:
#    ensure => present,
#  }
#
#  Exec {
#    "build_rpms":
#      command => ""
#  }
#
#  Exec {
#    "java_exists":
#      command => "alternatives --set java /usr/lib/jvm/jre-1.6.0-sun/bin/java",
#      unless  => "alternatives --display java | grep 'points to' | grep -q '/usr/lib/jvm/jre-1.6.0-sun/bin/java'",
#      require => [ Package['java-1.6.0-sun'], Package['java-1.6.0-sun-devel'], Package['java-1.6.0-sun-fonts'] ],
#  }
#  Exec {
#    "javac_exists":
#      command => 'alternatives --set javac /usr/lib/jvm/java-1.6.0-sun/bin/javac',
#      unless  => "alternatives --display javac| grep 'points to' | grep -q '/usr/lib/jvm/java-1.6.0-sun/bin/javac'",
#      require => [ Package['java-1.6.0-sun'], Package['java-1.6.0-sun-devel'], Package['java-1.6.0-sun-fonts'] ],
#  }
#}
