# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name            'Catalyst-Plugin-Dumper';
all_from        'lib/Catalyst/Plugin/Dumper.pm';

# Specific dependencies
build_requires  'Test::More'        => '0.72';

WriteAll;
