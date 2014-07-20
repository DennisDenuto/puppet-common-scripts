# Will fetch and save gihub repositories in your bundle directory
define common-scripts::vimbundle() {
  repository { "/Users/${::boxen_user}/.vim/bundle/vimcolorssolarized":
    source  => "altercation/vimcolorssolarized",
  }
}
