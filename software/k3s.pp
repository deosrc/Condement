#######################################
# Install k3s
#######################################
# This file must use LF line endings!
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
  require => [ File['/etc/systemd/system/k3s.service'], Exec['systemd-reload'] ],
  notify  => Exec['pause-for-startup']
}

# Create alias for standard kubernetes commands to k3s
$alias_file = "
alias kubectl='k3s kubectl'
alias crictl='k3s crictl'
"
file { '/home/dev/.k3s-aliases':
  ensure  => file,
  content => $alias_file,
  require => Service['k3s']
}

file_line { 'k3s-aliases-import':
  ensure => present,
  path   => '/home/dev/.bashrc',
  line   => 'source ~/.k3s-aliases'
}

# Pause briefly once installed to give the service time to start fully.
exec { 'pause-for-startup':
  command     => 'sleep 5s',
  refreshonly => true
}
