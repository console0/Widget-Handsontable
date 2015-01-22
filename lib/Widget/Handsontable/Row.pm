package Widget::Handsontable::Row;

use strict;
use warnings;

# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Widget::Handsontable::Row - Perl extension for blah blah blah

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

See https://github.com/handsontable/handsontable/wiki/Options for args
                                                                                                                                                                                                  
=cut

our $AUTOLOAD;

sub __new
{
    my ( $class, $columns, $row_number ) = @_;
    my $self = {};
    bless( $self, $class );
    $self->{__columns}    = $columns;
    $self->{__row_number} = $row_number;
    return $self;
}

=head2 AUTOLOAD

=cut

sub AUTOLOAD
{
    my ( $self, $value ) = @_;
    my $colname = $AUTOLOAD;

    # set col OR set col method
    if ( defined($value) )
    {
        if ( ref($value) eq 'CODE' )
        {
            $self->{ '__m' . $colname } = $value;
            delete( $self->{ '__v' . $colname } );
        }
        else
        {
            $self->{ '__v' . $colname } = $value;
            delete( $self->{ '__m' . $colname } );
        }
    }

    exists( $self->{ '__m' . $colname } ) ? return $self->{ '__m' . $colname }() : return $self->{ '__v' . $colname };
}

=head2 serialize

=cut

sub serialize
{
    my ( $self, %args ) = @_;

    my $ref = { '__row_number' => $self->{__row_number} };
    foreach my $column ( @{ $self->{__columns} } )
    {
        my $colname = $column->{name};
        $ref->{$colname} = $self->$colname;
    }
    return $ref;
}

1;
