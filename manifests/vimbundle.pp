# Will fetch and save gihub repositories in your bundle directory
define common-scripts::vimbundle($repo_name, $repo) {
  repository { "/Users/${::boxen_user}/.vim/bundle/${repo}":
    source  => "${repo_name}/${repo}",
  }
}
