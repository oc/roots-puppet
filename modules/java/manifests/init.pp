#class java {
#
#  TODO: Install JVM to /usr/java
#  Exec {
#    "install-jvm":
#      command => "fetch the latest jdk?",
#      require => [ File['/usr/java/default/bin/java'], File['/usr/java'] ],
#  }
#  TODO: Add Symlink /usr/java/default -> latest
#  TODO: Add Symlink /usr/java/latest  -> jdk
#
#  Exec {
#    "java_exists":
#      command => "alternatives --set java /usr/java/default/bin/java",
#      unless  => "alternatives --display java | grep 'points to' | grep -q '/usr/java/default/bin/java'",
#      require => [ Exec['install-jvm'] ],
#  }
#  Exec {
#    "javac_exists":
#      command => 'alternatives --set javac /usr/java/default/bin/javac',
#      unless  => "alternatives --display javac| grep 'points to' | grep -q '/usr/java/default/bin/javac'",
#      require => [ ],
#  }
#  TODO: Add JAVA_HOME to /etc/profile
#}
