#class java {
#
#  TODO: Install JVM to /usr/java
#  exec { "Install Oracle JDK":
#      command => "fetch the latest jdk?",
#      require => [ File['/usr/java/default/bin/java'], File['/usr/java'] ],
#  }
#  TODO: Add Symlink /usr/java/default -> latest
#  TODO: Add Symlink /usr/java/latest  -> jdk
#
#  exec { "set Oracle JDK as default java alternative":
#      command => "alternatives --set java /usr/java/default/bin/java",
#      unless  => "alternatives --display java | grep 'points to' | grep -q '/usr/java/default/bin/java'",
#      require => [ Exec['Install Oracle JDK'] ],
#  }
#
#  exec { "set Oracle JDK as default javac alternative":
#      command => 'alternatives --set javac /usr/java/default/bin/javac',
#      unless  => "alternatives --display javac| grep 'points to' | grep -q '/usr/java/default/bin/javac'",
#      require => [ ],
#  }
#  TODO: Append JAVA_HOME to /etc/profile
#}
