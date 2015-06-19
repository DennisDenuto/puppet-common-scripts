# This is a placeholder class.
#class bash_config_scripts($username) {
class commonscripts($username="") {
  include go
  include sshpass
  include oracle
  include youcompleteme

  file { "/Users/$username/config":
    source  => "puppet:///modules/commonscripts/config",
    recurse => true,
  }
  file { "/Users/$username/.gitconfig":
    source  => "puppet:///modules/commonscripts/git/.gitconfig",
  }
  file { "/Users/$username/Library/Preferences/net.limechat.LimeChat.plist":
    source  => "puppet:///modules/commonscripts/limechat/net.limechat.LimeChat.plist",
  }
  file { "/Users/$username/.oh-my-zsh/custom/plugins":
    source  => "puppet:///modules/commonscripts/ohmyzsh/custom/plugins",
    recurse => true,
  }

  $home = "/Users/${::boxen_user}"
  $vimrc = "${home}/.vimrc"
  $vimdir = "${home}/.vim"

  file { [$vimdir,
    "${vimdir}/autoload",
    "${vimdir}/bundle"]:
    ensure  => directory,
    recurse => true,
  }

  repository { "${vimdir}/bundle/Vundle.vim":
    source => 'gmarik/Vundle.vim',
    require => File["${vimdir}"],
  }

  file { "/Users/$username/Library/KeyBindings/DefaultKeyBinding.dict":
     ensure  => present,
     source  => "puppet:///modules/commonscripts/osx_keymappings/DefaultKeyBinding.dict",
  }

  file { "/Users/$username/Library/Keyboard Layouts/intellij.keylayout":
     ensure  => present,
     source  => "puppet:///modules/commonscripts/osx_keylayouts/intellij.keylayout",
  }

  file { "${vimrc}": 
     ensure  => present,
     source  => "puppet:///modules/commonscripts/vim/.vimrc",
  }

  exec { "install_vundles":
    command => "vim +PluginInstall +qall",
    path    => "/opt/boxen/homebrew/bin/:/usr/local/bin/:/bin/:/usr/bin/",
    logoutput => true,
    require => Repository["${vimdir}/bundle/Vundle.vim"],
  }

  # aws cli
  file { "/Users/$username/.ec2_cli":
    source  => "puppet:///modules/commonscripts/aws_cli/AWS-ElasticBeanstalk-CLI-2.6.3",
    ensure  => directory,
    recurse => true,
  }
  file { "/Users/$username/.aws":
    source  => "puppet:///modules/commonscripts/.aws",
    ensure  => directory,
    recurse => true,
  }

  # useful scripts
  file { "/usr/local/bin":
    source  => "puppet:///modules/commonscripts/useful_scripts",
    ensure  => directory,
    recurse => true,
  }
  file { "/Users/$username/.sbt":
     ensure  => directory,
  }

  file { "/Users/$username/.sbt/0.13/plugins":
     source  => "puppet:///modules/commonscripts/sbt/plugins",
     ensure  => directory,
     recurse => true,
     require => File["/Users/$username/.sbt"],
  }
  file { "/Users/$username/.sbt/plugins":
     source  => "puppet:///modules/commonscripts/sbt_0_12/plugins",
     ensure  => directory,
     recurse => true,
     require => File["/Users/$username/.sbt"],
  }
  file { "/Users/$username/.sbt/0.13/np.sbt":
     source  => "puppet:///modules/commonscripts/sbt/np.sbt",
     require => File["/Users/$username/.sbt/0.13/plugins"],
     ensure  => file,
  }
}
