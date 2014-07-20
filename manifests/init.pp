# This is a placeholder class.
#class bash_config_scripts($username) {
class common-scripts($username="") {
include vim

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
}
