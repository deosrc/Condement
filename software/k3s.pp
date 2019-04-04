#######################################
# Install k3s
#######################################

# Set the default path for all exec resources in this file.
Exec {
  path => ['/usr/local/sbin','/usr/local/bin','/usr/sbin','/usr/bin','/sbin','/bin']
}

exec { 'k3s-download':
  command => 'curl -sSL https://github.com/rancher/k3s/releases/download/v0.3.0/k3s -o /usr/local/bin/k3s && chmod +x /usr/local/bin/k3s',
  creates => '/usr/local/bin/k3s'
}

file { '/etc/systemd/system/k3s.service':
  ensure  => file,
  source  => 'https://raw.githubusercontent.com/rancher/k3s/v0.3.0/k3s.service',
  require => Exec['k3s-download'],
  notify  => Exec['systemd-reload']
}

exec { 'systemd-reload':
  command     => 'systemctl daemon-reload',
  refreshonly => true
}

service { 'k3s':
  ensure  => running,
  enable  => true,
  require => [ File['/etc/systemd/system/k3s.service'], Exec['systemd-reload'] ]
}
