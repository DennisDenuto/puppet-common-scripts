class commonscripts::sshpass {

 homebrew::formula {
    'sshpass':
      source => 'puppet:///modules/commonscripts/brews/sshpass.rb' ;
  }
  package { 'boxen/brews/sshpass': }
}

