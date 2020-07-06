package { 'netbeans':
  ensure => installed,
}
package { 'docker.io':
  ensure => installed,
}
class { 'java':
  package => 'openjdk-8-jre',
  java_alternative => 'java-1.8.0-openjdk-amd64',
  java_alternative_path => '/usr/lib/jvm/java-1.8.0-openjdk-amd64',
}
class { 'git':
}
node 'dev01' {
  git::config { 'user.name':
    value => 'Krzysztof Walczak',
  }
  git::config { 'user.email':
    value => 'krzysztof.walczak1@unilodz.eu'
  }
}
