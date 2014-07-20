# Will fetch and save gihub repositories in your bundle directory
define common-scripts::vim-bundle($name, $repo) {
  repository { "/Users/${::boxen_user}/.vim/bundle/${repo}":
    source  => "${name}/${repo}",
  }
}
