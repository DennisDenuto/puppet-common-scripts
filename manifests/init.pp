# This is a placeholder class.
#class bash_config_scripts($username) {
class common-scripts($username="") {
  file { "/Users/$username/config":
    source  => "puppet:///modules/common-scripts/config",
    recurse => true,
  }
  file { "/Users/$username/.gitconfig":
    source  => "puppet:///modules/common-scripts/git/.gitconfig",
  }
  file { "/Users/$username/Library/Preferences/net.limechat.LimeChat.plist":
    source  => "puppet:///modules/common-scripts/limechat/net.limechat.LimeChat.plist",
  }
  file { "/Users/$username/.oh-my-zsh/custom/plugins":
    source  => "puppet:///modules/common-scripts/ohmyzsh/custom/plugins",
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

  file { "/Users/$username/Library/KeyBindings":
     ensure  => present,
     source  => "puppet:///modules/common-scripts/osx_keymappings/DefaultKeyBinding.dict",
  }

  file { "${vimrc}": 
     ensure  => present,
     source  => "puppet:///modules/common-scripts/vim/.vimrc",
  }

  exec { "install_vundles":
    command => "vim +PluginInstall +qall",
    path    => "/opt/boxen/homebrew/bin/:/usr/local/bin/:/bin/",
    logoutput => true,
    require => File["${vimrc}"],
  }

  # aws cli
  file { "/Users/$username/.ec2_cli":
    source  => "puppet:///modules/common-scripts/aws_cli/AWS-ElasticBeanstalk-CLI-2.6.3",
    ensure  => directory,
    recurse => true,
  }
  file { "/Users/$username/.aws":
    source  => "puppet:///modules/common-scripts/.aws",
    ensure  => directory,
    recurse => true,
  }

  # useful scripts
  file { "/usr/local/bin":
    source  => "puppet:///modules/common-scripts/useful_scripts",
    ensure  => directory,
    recurse => true,
  }
  file { "/Users/$username/.sbt/0.13/plugins":
     source  => "puppet:///modules/common-scripts/sbt/plugins",
     ensure  => directory,
     recurse => true,
  }
  file { "/Users/$username/.sbt/plugins":
     source  => "puppet:///modules/common-scripts/sbt_0_12/plugins",
     ensure  => directory,
     recurse => true,
  }
  file { "/Users/$username/.sbt/0.13/np.sbt":
     source  => "puppet:///modules/common-scripts/sbt/np.sbt",
     require => File["/Users/$username/.sbt/0.13/plugins"],
     ensure  => file,
  }
}
