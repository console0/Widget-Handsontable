package Widget::Handsontable;

use 5.008000;
use strict;
use warnings;
use Widget::Handsontable::Row;
use JSON;
our $VERSION = '0.01';

# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Widget::Handsontable - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Widget::Handsontable;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Widget::Handsontable, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head1 METHODS

=head2 new

Constructor

=cut

my $supported_constructor_args = { 
            columnSorting => { is_bool => 1 },
            autoColumnSize => { is_bool => 1 },
            fixedColumnsLeft => { is_bool => 1 },
            id => {} 
        };

sub new 
{
    my ($class, %args) = @_;
    my $columns = delete($args{columns});
    my $self = {};
    $self->{__constructor_args} = { %args };
    $self->{__rows} = [];
    bless ($self, $class);
    $self->__initialize_columns($columns);
    return $self;
}

=head2 addrow

=cut

sub addrow 
{
    my ($self, %args) = @_;
    my $new_row = Widget::Handsontable::Row->__new( $self->{__columns} );
    while (my ($name, $data) = each(%args) )
    {
        $new_row->$name($data);
    }
    push (@{$self->{__rows}},$new_row);
    return $new_row;
}

=head2 rows

=cut

sub rows 
{
    my ($self, %args) = @_;
    return $self->{__rows};
}

=head2 serialize

=cut

sub serialize 
{
    my ($self, %args) = @_;
    # array serialization
    my $struct = {};
    my @data;
    my @headers;

    foreach my $column (@{$self->{__columns}})
    {
        push(@headers,$column->{header});
    }
    $struct->{colHeaders} = \@headers;

    foreach my $row (@{$self->{__rows}})
    {
        push(@data, $row->serialize);
    }
    $struct->{data} = \@data;

    while (my ($arg,$conf) = each($supported_constructor_args))
    {
        if (exists($self->{__constructor_args}->{$arg}))
        {
            if ($conf->{is_bool})
            {
                $struct->{$arg} = $self->{__constructor_args}->{$arg} ? JSON::true : JSON::false;
            }
        }
    }
    
    return $struct;
}

=head2 serialize_as_json

=cut

sub serialize_as_json 
{
    my ($self, %args) = @_;
    return to_json($self->serialize(%args));
}

# INTERNAL METHODS
# may not need this eventually, not sure yet

sub __initialize_columns 
{
    my ($self, $columns) = @_;
    $self->{__columns} = $columns;
    return;
}

=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Marcus Slagle, E<lt>mslagle@whapps.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2015 by Marcus Slagle

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.


=cut

1;
