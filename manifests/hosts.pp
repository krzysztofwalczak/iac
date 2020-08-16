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
