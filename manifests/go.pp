class commonscripts::go {

  file_line { 'GOROOT':
    path => '/etc/zshenv',
    line => "export GOROOT=/opt/boxen/homebrew/Cellar/go/1.6rc2/libexec",
  }

  file_line { 'GOPATH':
    path => '/etc/zshenv',
    line => "export GOPATH=/Users/${boxen_user}/.go",
  }

  $go_directory = [
      "/Users/${boxen_user}/.go/",
      "/Users/${boxen_user}/.go/src/",
      "/Users/${boxen_user}/.go/src/github.com/",
      "/Users/${boxen_user}/.go/src/github.com/user/",
      ]

  file { $go_directory :
        ensure  => directory,
  }

  exec { "go get golang.org/x/tools/cmd/godoc":
    environment => ["GOPATH=/Users/${boxen_user}/.go"],
    logoutput => true,
    require => File[$go_directory],
  }

  exec { "go get golang.org/x/tools/cmd/vet":
    environment => ["GOPATH=/Users/${boxen_user}/.go"],
    logoutput => true,
    require => File[$go_directory],
  }
}
