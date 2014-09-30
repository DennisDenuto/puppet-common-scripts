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

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-xml":
    source  => "othree/xml.vim",
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-java-decompiler-using-jad":
    source  => "vim-scripts/JavaDecompiler.vim",
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

}
