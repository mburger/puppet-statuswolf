# Class: statuswolf::install
#
# This class installs statuswolf
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
class statuswolf::install inherits statuswolf {

  case $statuswolf::install {

    package: {
      package { 'statuswolf':
        ensure => $statuswolf::manage_package,
        name => $statuswolf::package,
      }
    }

    source: {
      puppi::netinstall { 'netinstall_statuswolf':
        url => $statuswolf::real_install_source,
        destination_dir => $statuswolf::real_install_destination,
        extracted_dir => $statuswolf::created_dirname,
        preextract_command => $statuswolf::install_precommand,
        postextract_command => $statuswolf::real_install_postcommand,
      }

      file {
        'link statuswolf':
          ensure  => "${statuswolf::home}",
          path    => "${statuswolf::linked_dirname}"
      }
    }

    default: { }

  }

}
