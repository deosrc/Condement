#######################################
# Install Desktop UI & useful GUI tools
#######################################
package { 'lubuntu-desktop':
  ensure          => present,
  install_options => '--no-install-recommends'
}
