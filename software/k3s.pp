#######################################
# Install k3s
#######################################
# This file must use LF line endings!
#######################################

$k3s_version = '0.5.0'

# Set the default path for all exec resources in this file.
Exec {
  path => ['/usr/local/sbin','/usr/local/bin','/usr/sbin','/usr/bin','/sbin','/bin']
}

file { '/home/vagrant/k3s-install.sh':
  ensure => file,
  source => 'https://raw.githubusercontent.com/rancher/k3s/master/install.sh',
  mode   => '0750'
}

exec { '/home/vagrant/k3s-install.sh':
  require => File['/home/vagrant/k3s-install.sh']
}

service { 'k3s':
  ensure  => running,
  enable  => true,
  require => Exec['/home/vagrant/k3s-install.sh'],
  notify  => Exec['pause-for-startup']
}

# Create alias for standard kubernetes commands to k3s
$alias_file = "
alias kubectl='k3s kubectl'
alias kc='k3s kubectl'
alias crictl='k3s crictl'
"
file { '/home/dev/.k3s-aliases':
  ensure  => file,
  content => $alias_file
}

file_line { 'k3s-aliases-import':
  ensure  => present,
  path    => '/home/dev/.bashrc',
  line    => 'source ~/.k3s-aliases',
  require => File['/home/dev/.k3s-aliases']
}

# Pause briefly once installed to give the service time to start fully.
exec { 'pause-for-startup':
  command     => 'sleep 5s',
  refreshonly => true
}
