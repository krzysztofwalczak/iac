class { 'docker':

}


class {'docker::compose':
  ensure => present,
}

docker_compose {'loadbalancer_environment':
  compose_files => ['/opt/iac/environments/loadbalancer/docker-compose.yml'],
  ensure => present,
}
