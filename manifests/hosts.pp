host { 'app01':
    name => 'app01',
    ensure => 'present',
    ip => '172.17.0.3',
}

host { 'app02':
    name => 'app02',
    ensure => 'present',
    ip => '172.17.0.4',
}

host { 'ihs01':
    name => 'ihs01',
    ensure => 'present',
    ip => '172.17.0.2',
}

host { 'dev01':
    name => 'dev01',
    ensure => 'present',
    ip => '192.168.0.4',
}

host { 'puppet':
    name => 'puppet',
    ensure => 'present',
    ip => '192.168.0.3',
}

host { 'pupp01':
    name => 'pupp01',
    ensure => 'present',
    ip => '192.168.0.3',
}
