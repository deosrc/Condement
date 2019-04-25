#######################################
# Install Go development resources
#######################################

file { '/home/vagrant/go1.12.2.linux-amd64.tar.gz':
  ensure => file,
  source => 'https://dl.google.com/go/go1.12.2.linux-amd64.tar.gz'
}

exec { 'install-golang':
  command => '/bin/tar -C /usr/local -xvzf go1.12.2.linux-amd64.tar.gz',
  cwd     => '/home/vagrant/',
  require => File['/home/vagrant/go1.12.2.linux-amd64.tar.gz']
}

file_line { 'add-go-to-path':
  ensure => present,
  path   => '/home/dev/.profile',
  line   => 'export PATH=$PATH:/usr/local/go/bin'
}
