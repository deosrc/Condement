#######################################
# Install firefox
#######################################

package { 'firefox':
  ensure => present
}

# Configure folders for persistent storage
file { '/mnt/persistent_storage/firefox':
  ensure => directory,
  owner  => 'dev',
  group  => 'dev'
}

file { '/home/dev/.mozilla':
  ensure => directory,
  owner  => 'dev',
  group  => 'dev'
}

file { '/home/dev/.mozilla/firefox':
  ensure  => link,
  target  => '/mnt/persistent_storage/firefox',
  require => File['/mnt/persistent_storage/firefox', '/home/dev/.mozilla']
}
