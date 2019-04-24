#######################################
# Install Desktop UI & useful GUI tools
#######################################
package { 'ubuntu-budgie-desktop':
  ensure          => present,
  install_options => '--no-install-recommends'
}

package { 'budgie-desktop':
  ensure => present
}

package { 'gnome-software':
  ensure  => present,
  require => Package['ubuntu-budgie-desktop']
}
