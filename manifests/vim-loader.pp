# Adds the pathogen vim-loader line to your vim config

# This class requires your vimrc to be managed by puppet
#   (IE: the File[/Users/.../.vimrc] resource must exist)

# Examples
#
#   include vim
#   vim::vim-loader

class common-scripts::vim-loader {
  require common-scripts::vim

  # Install pathogen into .vimrc
  file_line { 'load_pathogen':
    ensure  => present,
    line    => 'execute pathogen#infect()',
    path    => $common-scripts::vim::vimrc,
    require => File[$common-scripts::vim::vimrc]
  }
}