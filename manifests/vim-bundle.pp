# Will fetch and save gihub repositories in your bundle directory
define common-scripts::vim-bundle() {
  $bundle = split($name, '/')
  repository { "/Users/${::boxen_user}/.vim/bundle/${bundle[1]}":
    source  => $name,
  }
}
