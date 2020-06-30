package { 'netbeans':
  ensure => installed,
}

class { 'java':
 package => 'openjdk-8-jre',
 java_alternative => 'java-1.8.0-openjdk-amd64',
 java_alternative_path => '/usr/lib/jvm/java-1.8.0-openjdk-amd64',
}

class { 'git':

}
