class commonscripts::go {

  file_line { 'GOPATH':
    path => '/etc/zshenv',
    line => "export GOROOT=/opt/boxen/homebrew/Cellar/go/1.4.2/libexec",
  }

}
