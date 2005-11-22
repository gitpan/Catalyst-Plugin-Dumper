use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Catalyst::Plugin::Dumper',
    license             => 'perl',
    dist_author         => 'Chisel Wright <pause@herlpacker.co.uk>',
    dist_version_from   => 'lib/Catalyst/Plugin/Dumper.pm',
    requires => {
        'Test::More' => 0,
        'version'    => 0,
    },
    add_to_cleanup      => [ 'Catalyst-Plugin-Dumper-*' ],
);

$builder->create_build_script();
