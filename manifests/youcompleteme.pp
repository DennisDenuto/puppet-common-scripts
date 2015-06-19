class commonscripts::youcompleteme {

  $homedir  = "/Users/${boxen_user}"
  $pluginpath  = "/Users/${boxen_user}/.vim/bundle/YouCompleteMe"

  file { $pluginpath:
    ensure => directory
  }

  exec { 'makefiles-ycm':
    command => "cd ${pluginpath} && ./install.sh --clang-completer --gocode-completer",
    require => File[$pluginpath]
  }

}
