# Class: statuswolf::config
#
# This class manages statuswolf configuration
#
# == Variables
#
# Refer to statuswolf class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by statuswolf
#
class statuswolf::config {

  file {
    'statuswolf_statuswolf.conf':
      ensure  => $statuswolf::manage_file,
      path    => $statuswolf::real_statuswolf_conf_file,
      mode    => $statuswolf::config_file_mode,
      owner   => $statuswolf::config_file_owner,
      group   => $statuswolf::config_file_group,
      source  => $statuswolf::manage_statuswolf_file_source,
      content => $statuswolf::manage_statuswolf_file_content,
      replace => $statuswolf::manage_file_replace,
      audit   => $statuswolf::manage_audit,
      noop    => $statuswolf::bool_noops;
    'statuswolf_auth.conf':
      ensure  => $statuswolf::manage_file,
      path    => $statuswolf::real_auth_conf_file,
      mode    => $statuswolf::config_file_mode,
      owner   => $statuswolf::config_file_owner,
      group   => $statuswolf::config_file_group,
      source  => $statuswolf::manage_auth_file_source,
      content => $statuswolf::manage_auth_file_content,
      replace => $statuswolf::manage_file_replace,
      audit   => $statuswolf::manage_audit,
      noop    => $statuswolf::bool_noops;
    'statuswolf_datasource.conf':
      ensure  => $statuswolf::manage_file,
      path    => $statuswolf::real_datasource_conf_file,
      mode    => $statuswolf::config_file_mode,
      owner   => $statuswolf::config_file_owner,
      group   => $statuswolf::config_file_group,
      source  => $statuswolf::manage_datasource_file_source,
      content => $statuswolf::manage_datasource_file_content,
      replace => $statuswolf::manage_file_replace,
      audit   => $statuswolf::manage_audit,
      noop    => $statuswolf::bool_noops;
  }

  # The whole statuswolf configuration directory can be recursively overriden
  if $statuswolf::source_dir {
    file { 'statuswolf.dir':
      ensure  => directory,
      path    => $statuswolf::real_config_dir,
      source  => $statuswolf::source_dir,
      recurse => true,
      purge   => $statuswolf::bool_source_dir_purge,
      force   => $statuswolf::bool_source_dir_purge,
      replace => $statuswolf::manage_file_replace,
      audit   => $statuswolf::manage_audit,
      noop    => $statuswolf::bool_noops,
    }
  }

}
