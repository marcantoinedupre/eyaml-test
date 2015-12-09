#
# Deploy nginx
#

node default {
  include nginx

  nginx::resource::vhost { 'www.example.com':
    www_root => '/var/www.example.com',
  }

  file { '/var/www.example.com':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755'
  }
  -> file { '/var/www.example.com/index.html':
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('nginx-example/index.html.erb'),
    }
}
