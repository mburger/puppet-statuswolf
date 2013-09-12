# Class: statuswolf::apache
#
# This class configures apache for statuswolf installation
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by statuswolf
#
class statuswolf::apache {

  apache::vhost { $statuswolf::web_virtualhost :
    template => $statuswolf::real_web_server_template,
    docroot => $statuswolf::linked_dirname,
  }

  apache::module { 'rewrite': }

  php::module { [ 'mysql', 'curl' ]: }
  php::pear::module {
    [ 'Auth', 'Log', 'MDB2', 'MDB2#mysqli', 'Math_Stats' ]:
      use_package => false,
  }

  php::pear::module { 'Math_Histogram-0.9.0':
    use_package => false,
    require     => Php::Pear::Module['Math_Stats'],
  }

}
