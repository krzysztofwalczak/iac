class { 'docker':

}


class {'docker::compose':
  ensure => present,
}

docker_compose {'simple_environment':
  compose_files => ['/opt/iac/environments/simple/docker-compose.yml'],
  ensure => present,
}
