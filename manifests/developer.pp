package { 'netbeans':
  ensure => installed,
}

package { 'default-jre':
  ensure => installed,
}

package { 'default-jdk':
  ensure => installed,
}

class { 'git':

}
