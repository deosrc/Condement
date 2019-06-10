#######################################
# Install GitKraken
#######################################

file { '/opt/gitkraken.deb':
  ensure => file,
  source => 'https://release.gitkraken.com/linux/gitkraken-amd64.deb'
}

package { [
    'gconf2',
    'gconf-service',
    'python',
    'gvfs-bin',
    'libgtk2.0-0',
    'xdg-utils'
  ]:
  ensure => present
}

package { 'gitkraken':
  ensure   => present,
  provider => 'dpkg',
  source   => '/opt/gitkraken.deb',
  require  => [ File['/opt/gitkraken.deb'], Package['gconf2', 'gconf-service', 'python', 'gvfs-bin'] ]
}

# Configure folders for persistent storage
file { '/mnt/persistent_storage/gitkraken':
  ensure => directory,
  owner  => 'dev',
  group  => 'dev'
}

file { '/home/dev/.gitkraken':
  ensure  => link,
  target  => '/mnt/persistent_storage/gitkraken',
  require => File['/mnt/persistent_storage/gitkraken']
}
