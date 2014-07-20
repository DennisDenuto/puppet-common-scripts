# Will fetch and save gihub repositories in your bundle directory
define common-scripts::vim-bundle() {

  notify {"Running with bundle!!":
      withpath => true,
  }

  notify {"name = $name":
      withpath => true,
  }

  $bundle = split($name, '/')
  notify {"bundle = $bundle":
      withpath => true,
  }

  $bundleName = $bundle[1]
  notify {"bundleName = $bundleName":
      withpath => true,
  }
  repository { "/Users/${::boxen_user}/.vim/bundle/${bundleName}":
    source  => $name,
  }
}
