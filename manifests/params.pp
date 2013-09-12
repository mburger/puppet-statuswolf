# Class: statuswolf::params
#
# This class defines default parameters used by the main module class statuswolf
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to statuswolf class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class statuswolf::params {

  ### WebApp specific parameters
  $install = 'source'
  $install_dirname = 'statuswolf'
  $install_precommand = ''
  $install_postcommand = ''
  $url_check = ''
  $url_pattern = 'statuswolf'
  $web_server = 'apache'
  $web_server_template = ''
  $template_auth = 'statuswolf/auth.conf.erb'
  $template_datasource = 'statuswolf/datasource.conf.erb'
  $template_statuswolf = 'statuswolf/statuswolf.conf.erb'
  $web_virtualhost = "$::fqdn"
  $db_file = '/opt/statuswolf_create_db.sql'
  $db_file_source = 'puppet:///modules/statuswolf/statuswolf_create_db.sql'
  $db_type = 'mysql'
  $db_host = 'localhost'
  $db_name = 'statuswolf'
  $db_user = 'statuswolf'
  $db_password = fqdn_rand(100000000000)
  $opentsdb_server = 'localhost:4242'

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'statuswolf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $log_dir = $::operatingsystem ? {
    default => '',
  }

  $log_file = $::operatingsystem ? {
    default => '',
  }

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $options = ''
  $version = '0.5.7'
  $absent = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
