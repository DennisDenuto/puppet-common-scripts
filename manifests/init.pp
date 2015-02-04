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

  repository { "${vimdir}/vim-pathogen":
    source => 'tpope/vim-pathogen'
  }

  file { "${vimdir}/autoload/pathogen.vim":
    target  => "${vimdir}/vim-pathogen/autoload/pathogen.vim",
    require => [
      File[$vimdir],
      File["${vimdir}/autoload"],
      File["${vimdir}/bundle"],
      Repository["${vimdir}/vim-pathogen"]
    ]
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-colors-solarized":
    source  => "altercation/vim-colors-solarized",
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-puppet":
    source  => "rodjek/vim-puppet",
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-json":
    source  => "elzr/vim-json",
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-scala":
    source  => "derekwyatt/vim-scala",
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-ctrlp":
    source  => "kien/ctrlp.vim",
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-java-decompiler-using-jad":
    source  => "vim-scripts/JavaDecompiler.vim",
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/nerdtree":
    source  => "scrooloose/nerdtree",
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/dockerfile":
    source  => "ekalinin/Dockerfile.vim",
  }

  file { "/Users/$username/Library/KeyBindings": 
     ensure  => present,
     source  => "puppet:///modules/common-scripts/osx_keymappings/DefaultKeyBinding.dict",
  }

  file { "${vimrc}": 
     ensure  => present,
     source  => "puppet:///modules/common-scripts/vim/.vimrc",
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
