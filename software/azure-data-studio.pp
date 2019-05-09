#######################################
# Install Azure Data Studio
#######################################

$azuredatastudio_version = '1.6.0'

file { "/home/vagrant/azuredatastudio-${azuredatastudio_version}.deb":
  ensure => file,
  source => "https://azuredatastudiobuilds.blob.core.windows.net/releases/${azuredatastudio_version}/azuredatastudio-linux-${azuredatastudio_version}.deb"
}

package { 'azuredatastudio':
  provider  => dpkg,
  ensure    => installed,
  source    => "/home/vagrant/azuredatastudio-${azuredatastudio_version}.deb"
}

# Configure folders for persistent storage
file { [
    '/mnt/persistent_storage/azuredatastudio',
    '/mnt/persistent_storage/azuredatastudio/user_home',
    '/mnt/persistent_storage/azuredatastudio/user_config'
  ]:
  ensure => directory,
  owner  => 'dev',
  group  => 'dev'
}

file { '/home/dev/.azuredatastudio':
  ensure  => link,
  target  => '/mnt/persistent_storage/azuredatastudio/user_home',
  require => File['/mnt/persistent_storage/azuredatastudio/user_home']
}

file { '/home/dev/.config/azuredatastudio':
  ensure  => link,
  target  => '/mnt/persistent_storage/azuredatastudio/user_config',
  require => File['/mnt/persistent_storage/azuredatastudio/user_config']
}
