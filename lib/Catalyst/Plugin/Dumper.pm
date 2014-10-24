package Catalyst::Plugin::Dumper;
# vim: ts=8 sts=4 et sw=4 sr sta
use warnings;
use strict;
use 5.8.1;

our $VERSION = '0.00004';

use Carp;

# Module implementation here
use Data::Dumper;
$Data::Dumper::Sortkeys = 1;

sub Catalyst::Log::dumper {
  my ($self, $var, $label) = @_;

  if (defined $label) {
      # temporarily change the Varname that D::D uses
      local $Data::Dumper::Varname = $label;
      $self->debug( Dumper($var) );
  }
  else {
      $self->debug( Dumper($var) );
  }
}

# (contributed by James Kiser (pause: JKISER)
# use $c->error method to generate pretty DD output
sub dumper {
    my ($self, $var, $label) = @_;

    if (defined $label) {
        # temporarily change the Varname that D::D uses
        local $Data::Dumper::Varname = $label;
        $self->error( Dumper($var) );
    }
    else {
        $self->error( Dumper($var) );
    }
}


1; # Magic true value required at end of module
__END__

=head1 NAME

Catalyst::Plugin::Dumper - Data::Dumper plugin for Catalyst


=head1 VERSION

This document describes Catalyst::Plugin::Dumper version 0.0.1


=head1 SYNOPSIS

    use Catalyst qw/-Debug Dumper/;

    $c->log->dumper($myvar);
    $c->log->dumper($myvar, 'mylabel');

=head1 DESCRIPTION

This plugin injects a dumper() method into the L<Catalyst::Log> namespace.

=head1 INTERFACE 

=for author to fill in:
    Write a separate section listing the public components of the modules
    interface. These normally consist of either subroutines that may be
    exported, or methods that may be called on objects belonging to the
    classes provided by the module.

=head2 dumper($myvar,$mylabel)

Sends the output of L<Data::Dumper>::Dumper($myvar) to $c->log->debug()

I<$mylabel> is optional and if specified will be used as the temporary value of
I<$Data::Dumper::Varname>.


=head1 DEPENDENCIES

=for author to fill in:
    A list of all the other modules that this module relies upon,
    including any restrictions on versions, and an indication whether
    the module is part of the standard Perl distribution, part of the
    module's distribution, or must be installed separately. ]

L<Data::Dumper>


=head1 INCOMPATIBILITIES

=for author to fill in:
    A list of any modules that this module cannot be used in conjunction
    with. This may be due to name conflicts in the interface, or
    competition for system or program resources, or due to internal
    limitations of Perl (for example, many modules that use source code
    filters are mutually incompatible).

None reported.


=head1 BUGS AND LIMITATIONS

=for author to fill in:
    A list of known problems with the module, together with some
    indication Whether they are likely to be fixed in an upcoming
    release. Also a list of restrictions on the features the module
    does provide: data types that cannot be handled, performance issues
    and the circumstances in which they may arise, practical
    limitations on the size of data sets, special cases that are not
    (yet) handled, etc.

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-catalyst-plugin-dumper@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.

=head1 SEE ALSO

=over 4

=item L<Catalyst> - The Elegant MVC Web Application Framework

=item L<Data::Dumper> - stringified perl data structures

=back

=head1 AUTHOR

Chisel Wright  C<< <pause@herlpacker.co.uk> >>

=head1 ADDITIONAL FUNCTIONALITY

James Kiser C<< pause: JKISER >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2005-2007, Chisel Wright C<< <pause@herlpacker.co.uk> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
