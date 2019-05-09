#######################################
# Install Go development resources
#######################################
# Set the default path for all exec resources in this file.
Exec {
  path => ['/usr/local/sbin','/usr/local/bin','/usr/sbin','/usr/bin','/sbin','/bin','/usr/local/go/bin']
}

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
  ensure  => present,
  path    => '/home/dev/.profile',
  line    => 'export PATH=$PATH:/usr/local/go/bin',
  require => Exec['install-golang']
}

# Setup the GOPATH for the user
file { '/home/dev/go':
  ensure => directory,
  owner  => 'dev',
  group  => 'dev'
}

# Install the development tools
exec { [
  'go get github.com/ramya-rao-a/go-outline',
  'go get github.com/acroca/go-symbols',
  'go get github.com/mdempsky/gocode',
  'go get github.com/rogpeppe/godef',
  'go get golang.org/x/tools/cmd/godoc',
  'go get github.com/zmb3/gogetdoc',
  'go get golang.org/x/lint/golint',
  'go get github.com/fatih/gomodifytags',
  'go get golang.org/x/tools/cmd/gorename',
  'go get sourcegraph.com/sqs/goreturns',
  'go get golang.org/x/tools/cmd/goimports',
  'go get github.com/cweill/gotests/...',
  'go get golang.org/x/tools/cmd/guru',
  'go get github.com/josharian/impl',
  'go get github.com/haya14busa/goplay/cmd/goplay',
  'go get github.com/uudashr/gopkgs/cmd/gopkgs',
  'go get github.com/davidrjenni/reftools/cmd/fillstruct',
  'go get github.com/alecthomas/gometalinter',
  'go get github.com/go-delve/delve/cmd/dlv'
]:
  environment => [ 'GOPATH=/home/dev/go', 'GOCACHE=/home/dev/.cache/go-build' ],
  user        => 'dev',
  require     => [ Exec['install-golang'], File['/home/dev/go'] ]
}

# TODO: Persist $GOPATH/bin (and vendor/? )
