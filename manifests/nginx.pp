# Class: statuswolf::nginx
#
# This class configures nginx for statuswolf installation
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by statuswolf
#
class statuswolf::nginx inherits statuswolf {

  nginx::vhost { $statuswolf::web_virtualhost :
    template => $statuswolf::real_web_server_template,
    docroot => $statuswolf::real_data_dir,
  }

}
