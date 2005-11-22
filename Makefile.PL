use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Catalyst::Plugin::Dumper',
    AUTHOR              => 'Chisel Wright <pause@herlpacker.co.uk>',
    VERSION_FROM        => 'lib/Catalyst/Plugin/Dumper.pm',
    ABSTRACT_FROM       => 'lib/Catalyst/Plugin/Dumper.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'version'    => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Catalyst-Plugin-Dumper-*' },
);
