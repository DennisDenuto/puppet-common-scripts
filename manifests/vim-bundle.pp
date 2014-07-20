# Will fetch and save gihub repositories in your bundle directory
define common-scripts::vim-bundle() {

  $bundle = split("${name}", '/')
  $bundleName = "$bundle[1]"
  repository { "/Users/${::boxen_user}/.vim/bundle/${bundleName}":
    source  => "$name",
  }
}
