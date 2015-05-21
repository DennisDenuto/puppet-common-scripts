class commonscripts::oracle {
  file { '/tmp/sqlcl.zip':
    source  => "puppet:///modules/commonscripts/oracle_cli/sqlcl-4.1.0.15.106.1020-no-jre.zip",
    mode   => 0600,
    before => Exec['unzip_oracle'],
  }

  exec { 'unzip_oracle':
    unless => "test -f /usr/local/sqlcl",
    command => "unzip /tmp/sqlcl.zip -d /usr/local/ && chmod -R +rx /usr/local/sqlcl",
    user => root,
  }
}
