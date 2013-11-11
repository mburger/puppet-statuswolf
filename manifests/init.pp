# = Class: statuswolf
#
# This is the main statuswolf class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, statuswolf class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $statuswolf_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, statuswolf main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $statuswolf_source
#
# [*source_dir*]
#   If defined, the whole statuswolf configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $statuswolf_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $statuswolf_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, statuswolf main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $statuswolf_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $statuswolf_options
#
# [*service_autorestart*]
#   Automatically restarts the statuswolf service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $statuswolf_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $statuswolf_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $statuswolf_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $statuswolf_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for statuswolf checks
#   Can be defined also by the (top scope) variables $statuswolf_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $statuswolf_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $statuswolf_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $statuswolf_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $statuswolf_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for statuswolf port(s)
#   Can be defined also by the (top scope) variables $statuswolf_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling statuswolf. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $statuswolf_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $statuswolf_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $statuswolf_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $statuswolf_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in statuswolf::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of statuswolf package
#
# [*service*]
#   The name of statuswolf service
#
# [*service_status*]
#   If the statuswolf service init script supports status argument
#
# [*process*]
#   The name of statuswolf process
#
# [*process_args*]
#   The name of statuswolf arguments. Used by puppi and monitor.
#   Used only in case the statuswolf process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user statuswolf runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $statuswolf_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $statuswolf_protocol
#
#
# See README for usage patterns.
#
class statuswolf (
  $version = params_lookup( 'version' ),
  $install = params_lookup( 'install' ),
  $install_source = params_lookup( 'install_source' ),
  $install_destination = params_lookup( 'install_destination' ),
  $install_dirname = params_lookup( 'install_dirname' ),
  $install_precommand = params_lookup( 'install_precommand' ),
  $install_postcommand = params_lookup( 'install_postcommand' ),
  $url_check = params_lookup( 'url_check' ),
  $url_pattern = params_lookup( 'url_pattern' ),
  $web_server = params_lookup( 'web_server' ),
  $web_server_template = params_lookup( 'web_server_template' ),
  $auth_conf_file = params_lookup( 'auth_conf_file' ),
  $datasource_conf_file = params_lookup( 'datasource_conf_file' ),
  $statuswolf_conf_file = params_lookup( 'statuswolf_conf_file' ),
  $web_virtualhost = params_lookup( 'web_virtualhost' ),
  $db_file = params_lookup( 'db_file' ),
  $db_file_source = params_lookup( 'db_file_source' ),
  $db_type = params_lookup( 'db_type' ),
  $db_name = params_lookup( 'db_name' ),
  $db_host = params_lookup( 'db_host' ),
  $db_user = params_lookup( 'db_user' ),
  $db_password = params_lookup( 'db_password' ),
  $my_class = params_lookup( 'my_class' ),
  $source = params_lookup( 'source' ),
  $source_dir = params_lookup( 'source_dir' ),
  $source_dir_purge = params_lookup( 'source_dir_purge' ),
  $template_auth = params_lookup( 'template_auth' ),
  $template_datasource = params_lookup( 'template_datasource' ),
  $template_statuswolf = params_lookup( 'template_statuswolf' ),
  $options = params_lookup( 'options' ),
  $absent = params_lookup( 'absent' ),
  $monitor = params_lookup( 'monitor' , 'global' ),
  $monitor_tool = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target = params_lookup( 'monitor_target' , 'global' ),
  $puppi = params_lookup( 'puppi' , 'global' ),
  $puppi_helper = params_lookup( 'puppi_helper' , 'global' ),
  $debug = params_lookup( 'debug' , 'global' ),
  $audit_only = params_lookup( 'audit_only' , 'global' ),
  $package = params_lookup( 'package' ),
  $config_dir = params_lookup( 'config_dir' ),
  $config_file_mode = params_lookup( 'config_file_mode' ),
  $config_file_owner = params_lookup( 'config_file_owner' ),
  $config_file_group = params_lookup( 'config_file_group' ),
  $data_dir = params_lookup( 'data_dir' ),
  $log_dir = params_lookup( 'log_dir' ),
  $log_file = params_lookup( 'log_file' ),
  $opentsdb_server = params_lookup( 'opentsdb_server' ),
  $d3_location = params_lookup( 'd3_location' )
  ) inherits statuswolf::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_absent=any2bool($absent)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_noops=any2bool($noops)

  ### Definition of some variables used in the module
  $manage_package = $statuswolf::bool_absent ? {
    true  => 'absent',
    false => $statuswolf::version,
  }

  $manage_file = $statuswolf::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_audit = $statuswolf::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $statuswolf::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_statuswolf_file_source = $statuswolf::statuswolf_file_source ? {
    ''        => undef,
    default   => $statuswolf::statuswolf_file_source,
  }

  $manage_statuswolf_file_content = $statuswolf::template_statuswolf ? {
    ''        => undef,
    default   => template($statuswolf::template_statuswolf),
  }

  $manage_auth_file_source = $statuswolf::auth_file_source ? {
    ''        => undef,
    default   => $statuswolf::auth_file_source,
  }

  $manage_auth_file_content = $statuswolf::template_auth ? {
    ''        => undef,
    default   => template($statuswolf::template_auth),
  }

  $manage_datasource_file_source = $statuswolf::datasource_file_source ? {
    ''        => undef,
    default   => $statuswolf::datasource_file_source,
  }

  $manage_datasource_file_content = $statuswolf::template_datasource ? {
    ''        => undef,
    default   => template($statuswolf::template_datasource),
  }

  ### Calculations of variables whoe value depends on different params

  $real_install_source = $statuswolf::install_source ? {
    ''      => "https://github.com/box/StatusWolf/archive/${statuswolf::version}.zip",
    default => $statuswolf::install_source,
  }

  $created_dirname = "StatusWolf-${statuswolf::version}"

  $real_install_destination = $statuswolf::install_destination ? {
    ''        => $statuswolf::web_server ? {
      default => $::operatingsystem ? {
        /(?i:Debian|Ubuntu|Mint)/ => '/var/www',
        /(?i:Suse|OpenSuse)/      => '/srv/www',
        default                   => '/var/www/html',
      },
    },
    default => $statuswolf::install_destination,
  }

  $home = "${statuswolf::real_install_destination}/${statuswolf::created_dirname}"

  $linked_dirname = "${statuswolf::real_install_destination}/statuswolf"

  $real_auth_conf_file = $statuswolf::auth_conf_file ? {
    '' => $statuswolf::install ? {
      package => $::operatingsystem ? {
        default => '/etc/statuswolf/auth.conf',
      },
      default => "${statuswolf::home}/conf/auth.conf",
    },
    default => $statuswolf::auth_conf_file,
  }

  $real_datasource_conf_file = $statuswolf::datasource_conf_file ? {
    '' => $statuswolf::install ? {
      package => $::operatingsystem ? {
        default => '/etc/statuswolf/datasource.conf',
      },
      default => "${statuswolf::home}/conf/datasource.conf",
    },
    default => $statuswolf::datasource_conf_file,
  }

  $real_statuswolf_conf_file = $statuswolf::statuswolf_conf_file ? {
    '' => $statuswolf::install ? {
      package => $::operatingsystem ? {
        default => '/etc/statuswolf/statuswolf.conf',
      },
      default => "${statuswolf::home}/conf/statuswolf.conf",
    },
    default => $statuswolf::statuswolf_conf_file,
  }

  $real_config_dir = $statuswolf::config_dir ? {
    ''      => $statuswolf::install ? {
      package => $::operatingsystem ? {
        default => '/etc/statuswolf/',
      },
      default => "${statuswolf::real_install_destination}/${statuswolf::install_dirname}/conf/",
    },
    default => $statuswolf::config_dir,
  }

  $real_data_dir = $statuswolf::data_dir ? {
    ''      => $statuswolf::install ? {
      package => '/usr/share/statuswolf',
      default => "${statuswolf::real_install_destination}/${statuswolf::created_dirname}",
    },
    default => $statuswolf::data_dir,
  }

  $real_web_server_template = $statuswolf::web_server_template ? {
    ''      => $statuswolf::web_server ? {
      apache  =>  'statuswolf/apache/virtualhost.conf.erb',
      nginx   =>  'statuswolf/nginx/virtualhost.conf.erb',
    },
    default => $statuswolf::web_server_template,
  }

  $real_data_dir_user = $statuswolf::web_server ? {
    default => $::operatingsystem ? {
      /(?i:Ubuntu|Debian|Mint)/ => 'www-data',
      default                   => 'apache',
    }
  }

  # This sets the right permissions for statuswolf
  $real_install_postcommand = $install_postcommand ? {
    ''      => "bash -c 'mkdir -p ${real_data_dir}/cache/{anomaly_model,query_cache} && chown -R ${real_data_dir_user} ${real_data_dir}'",
    default => $statuswolf::install_postcommand,
  }

  ### Managed resources
  class { 'statuswolf::install': }
  class { 'statuswolf::config':
    require => Class['statuswolf::install'],
  }

  ### Include custom class if $my_class is set
  if $statuswolf::my_class {
    include $statuswolf::my_class
  }

  # Include web server configuration if requested
  case $statuswolf::web_server {
    apache: { include statuswolf::apache }
    nginx: { include statuswolf::nginx }
    default: { }
  }

  # Include database configuration, if db_type set
  case $statuswolf::db_type {
    mysql: { include statuswolf::mysql }
    default: { }
  }

  ### Provide puppi data, if enabled ( puppi => true )
  if $statuswolf::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'statuswolf':
      ensure    => $statuswolf::manage_file,
      variables => $classvars,
      helper    => $statuswolf::puppi_helper,
      noop      => $statuswolf::bool_noops,
    }
  }

  ### Service monitoring, if enabled ( monitor => true )
  if $statuswolf::bool_monitor == true and $statuswolf::url_check != '' {
    monitor::url { 'statuswolf_url':
      url => $statuswolf::url_check,
      pattern => $statuswolf::url_pattern,
      port => $statuswolf::port,
      target => $statuswolf::params::monitor_target,
      tool => $statuswolf::monitor_tool,
      enable => $statuswolf::manage_monitor,
    }
  }

  ### Debugging, if enabled ( debug => true )
  if $statuswolf::bool_debug == true {
    file { 'debug_statuswolf':
      ensure  => $statuswolf::manage_file,
      path    => "${settings::vardir}/debug-statuswolf",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $statuswolf::bool_noops,
    }
  }

}
