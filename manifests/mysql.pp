# Class: statuswolf::mysql
#
# This class configures mysql for statuswolf installation
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by statuswolf
#
class statuswolf::mysql inherits statuswolf {

  case $statuswolf::db_host {
    'localhost','127.0.0.1': {
      mysql::grant { "statuswolf_server_grants_${::fqdn}":
        mysql_db => $statuswolf::db_name,
        mysql_user => $statuswolf::db_user,
        mysql_password => $statuswolf::db_password,
        mysql_privileges => 'ALL',
        mysql_host => $statuswolf::db_host,
      }
    }
    default: {
# Automanagement of Mysql grants on external servers
# requires StoredConfigs.
      @@mysql::grant { "statuswolf_server_grants_${::fqdn}":
        mysql_db => $statuswolf::db_name,
        mysql_user => $statuswolf::db_user,
        mysql_password => $statuswolf::db_password,
        mysql_privileges => 'ALL',
        mysql_host => $::fqdn,
        tag => "mysql_grants_${statuswolf::db_host}",
      }
    }
  }

  file {
    "${statuswolf::db_file}":
      ensure  => $statuswolf::manage_file,
      source  => $statuswolf::db_file_source,
  }

  mysql::queryfile {
    "statuswolf_create_tables_${statuswolf::version}":
      mysql_file      => $statuswolf::db_file,
      mysql_db        => $statuswolf::db_name,
      mysql_user      => $statuswolf::db_user,
      mysql_password  => $statuswolf::db_password,
      mysql_host      => $statuswolf::db_host,
      require         => File[$statuswolf::db_file]
  }
}
