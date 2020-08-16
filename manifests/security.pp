class { 'firewall': }

resources { 'firewall':
  purge => true,
}

firewall { '000 accept all icmp requests':
  proto => 'icmp',
  action => 'accept',
}

firewall { '001 accept http requests from anywhere':
  dport => 80,
  action => 'accept',
}

firewall { '002 accept ssh/sftp requests from currenet network':
  dport => 22,
  action => 'accept',
  source => '192.168.0.0/24'
}

firewall { '003 accept Puppet agents from current network':
  dport => 8140,
  action => 'accept',
  source => '192.168.0.0/24'
}

firewall { '999 drop all other requests':
  action => 'drop',
}

