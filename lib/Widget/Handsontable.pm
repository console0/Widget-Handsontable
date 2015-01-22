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

See https://github.com/handsontable/handsontable/wiki/Options for args

=cut

my $supported_constructor_args = { autoColumnSize => { is_bool => 1 },
                                   autoComplete   => {
                                                     not_supported => 1,
                                                     message       => 'autoComplete is not supported'
                                                   },
                                   autoWrapCol => { is_bool => 1 },
                                   autoWrapRow => { is_bool => 1 },
                                   cells       => {
                                              not_supported => 1,
                                              message       => 'cells is not supported'
                                            },
                                   className  => { is_string => 1 },
                                   colHeaders => {
                                          not_supported => 1,
                                          message => 'colHeaders is generated from the column definitions automatically'
                                   },
                                   colWidths => { is_array  => 1,
                                                  is_string => 1
                                                },
                                   columnSorting => { is_bool => 1 },
                                   columns       => {
                                             not_supported => 1,
                                             message => 'columns is generated from the column definitions automatically'
                                   },
                                   contextMenu => { is_array => 1,
                                                    is_bool  => 1
                                                  },
                                   copyColsLimit       => { is_string => 1 },
                                   copyPaste           => { is_bool   => 1 },
                                   copyRowsLimit       => { is_string => 1 },
                                   currentColClassName => { is_string => 1 },
                                   currentRowClassName => { is_string => 1 },
                                   customBorders       => { is_bool   => 1 },
                                   data                => {
                                             not_supported => 1,
                                             message       => 'data is generated from the data automatically'
                                           },
                                   dataSchema => { not_supported => 1,
                                                   message       => 'dataSchema is not supported'
                                                 },
                                   debug              => { is_bool => 1 },
                                   enterBeginsEditing => { is_bool => 1 },
                                   enterMoves         => {
                                                   not_supported => 1,
                                                   message       => 'enterMoves is not supported'
                                                 },
                                   fillHandle => { is_bool   => 1,
                                                   is_string => 1
                                                 },
                                   fixedColumnsLeft  => { is_string => 1 },
                                   fixedRowsTop      => { is_string => 1 },
                                   fragmentSelection => { is_bool   => 1 },
                                   groups            => {
                                               is_bool  => 1,
                                               is_array => 1
                                             },
                                   height               => { is_string => 1 },
                                   id                   => { is_string => 1 },
                                   invalidCellClassName => { is_string => 1 },
                                   isEmptyCol           => {
                                                   not_supported => 1,
                                                   message       => 'isEmptyCol is not supported'
                                                 },
                                   isEmptyRow => { not_supported => 1,
                                                   message       => 'isEmptyRow is not supported'
                                                 },
                                   manualColumnMove => { not_supported => 1,
                                                         message       => 'manualColumnMove is not supported'
                                                       },
                                   manualColumnResize => { is_bool  => 1,
                                                           is_array => 1
                                                         },
                                   manualRowMove => { not_supported => 1,
                                                      message       => 'manualRowMove is not supported'
                                                    },
                                   manualRowResize => { is_bool  => 1,
                                                        is_array => 1
                                                      },
                                   maxCols    => { is_string => 1 },
                                   maxRows    => { is_string => 1 },
                                   mergeCells => { not_supported => 1,
                                                   message       => 'mergeCells is not supported'
                                                 },
                                   minCols             => { is_string => 1 },
                                   minRows             => { is_string => 1 },
                                   minSpareCols        => { is_string => 1 },
                                   minSpareRows        => { is_string => 1 },
                                   multiSelect         => { is_bool   => 1 },
                                   noWordWrapClassName => { is_string => 1 },
                                   observeChanges      => {
                                                       not_supported => 1,
                                                       message       => 'observeChanges is not supported'
                                                     },
                                   observeDOMVisibility  => { is_bool   => 1 },
                                   outsideClickDeselects => { is_bool   => 1 },
                                   pasteMode             => { is_string => 1 },
                                   persistantState       => {
                                                        not_supported => 1,
                                                        message       => 'persistantState is not supported'
                                                      },
                                   placeholder              => { is_string => 1 },
                                   placeholderCellClassName => { is_string => 1 },
                                   readOnlyCellClassName    => { is_string => 1 },
                                   rowHeaders               => {
                                                   is_bool  => 1,
                                                   is_array => 1
                                                 },
                                   search    => { is_bool   => 1 },
                                   startCols => { is_string => 1 },
                                   startRows => { is_string => 1 },
                                   stretchH  => { is_string => 1 },
                                   tabMove   => {
                                                not_supported => 1,
                                                message       => 'tabMove is not supported'
                                              },
                                   undo     => { is_bool   => 1 },
                                   width    => { is_string => 1 },
                                   wordWrap => { is_bool   => 1 }, };

my $supported_column_args = { allowInvalid => { is_bool   => 1 },
                              copyable     => { is_bool   => 1 },
                              editor       => { is_string => 1 },
                              format       => { is_string => 1 },
                              header       => {
                                          local    => 1,
                                          required => 1
                                        },
                              hidden => { local => 1 },
                              name   => {
                                        local    => 1,
                                        required => 1
                                      },
                              type      => { is_string => 1 },
                              readOnly  => { is_bool   => 1 },
                              renderer  => { is_string => 1 },
                              validator => { not_supported => 1,
                                             message       => 'validator is not supported'
                                           }, };

sub new
{
    my ( $class, %args ) = @_;
    my $columns = delete( $args{columns} );
    my $self    = {};
    $self->{__constructor_args} = {%args};
    $self->{__rows}             = [];
    $self->{__row_counter}      = 0;
    bless( $self, $class );
    $self->__initialize_columns($columns);
    return $self;
}

=head2 addrow

=cut

sub addrow
{
    my ( $self, %args ) = @_;

    my $new_row = Widget::Handsontable::Row->__new( $self->{__columns}, $self->{__row_counter} );
    while ( my ( $name, $data ) = each(%args) )
    {
        $new_row->$name($data);
    }
    push( @{ $self->{__rows} }, $new_row );
    $self->{__row_counter}++;
    return $new_row;
}

=head2 rows

=cut

sub rows
{
    my ( $self, %args ) = @_;
    return $self->{__rows};
}

=head2 serialize

=cut

sub serialize
{
    my ( $self, %args ) = @_;

    # array serialization
    my $struct = {};
    my @data;
    my @headers;
    my @columns;

    foreach my $column ( @{ $self->{__columns} } )
    {
        if ( !$column->{hidden} )
        {
            my $colref = { data => $column->{name} };
            while ( my ( $arg, $conf ) = each(%$supported_column_args) )
            {
                if ( exists( $column->{$arg} ) && ( !$conf->{local} ) )
                {
                    $colref->{$arg} = $column->{$arg};
                }
            }
            push( @columns, $colref );
        }
    }
    $struct->{columns} = \@columns;

    foreach my $column ( @{ $self->{__columns} } )
    {
        push( @headers, $column->{header} ) if !$column->{hidden};
    }
    $struct->{colHeaders} = \@headers;

    foreach my $row ( @{ $self->{__rows} } )
    {
        push( @data, $row->serialize );
    }
    $struct->{data} = \@data;

    while ( my ( $arg, $conf ) = each(%$supported_constructor_args) )
    {
        if ( exists( $self->{__constructor_args}->{$arg} ) )
        {
            $struct->{$arg} = $self->__arg_test( $arg, $conf, $self->{__constructor_args}->{$arg} );
        }
    }

    return $struct;
}

=head2 serialize_as_json

=cut

sub serialize_as_json
{
    my ( $self, %args ) = @_;
    return to_json( $self->serialize(%args) );
}

=head2 load_from_json

=cut

sub load_from_json
{
    my ( $self, $json, %args ) = @_;

    # ok, we have the inflated table, so iterate the rows and set the values
    my $data = from_json($json);
    my @sorted = sort { $a->{__row_number} <=> $b->{__row_number} } @$data;

    # we can now iterate through the internal rows and synchronize

    foreach my $incoming_row (@sorted)
    {
        my $original_row_number = delete( $incoming_row->{__row_number} );
        my $row_record          = @{ $self->{__rows} }[$original_row_number];

        # its possible that this is a "new" row, so ill add one if we have to
        if ( !$row_record )
        {
            $self->addrow(%$incoming_row);
        }

        # this was there, so lets overwrite it
        else
        {
            while ( my ( $k, $v ) = each(%$incoming_row) )
            {
                $row_record->$k($v);
            }
        }
    }

    return;
}

# INTERNAL METHODS

sub __initialize_columns
{
    my ( $self, $columns ) = @_;
    foreach my $col (@$columns)
    {
        while ( my ( $arg, $rules ) = each(%$supported_column_args) )
        {
            # die if the column isnt legit
            if ( exists( $col->{$arg} ) )
            {
                $col->{$arg} = $self->__arg_test( $arg, $rules, $col->{$arg} );
            }
        }
    }

    $self->{__columns} = $columns;
    return;
}

sub __arg_test
{
    my ( $self, $arg, $rules, $value ) = @_;

    # die on not supported
    if ( $rules->{not_supported} )
    {
        die( $rules->{message} );
    }

    # could be a Constructor arg ($self->{__constructor_args}->{$arg}) OR a column arg $column->{$arg}
    if ( ( $rules->{required} ) && ( !defined($value) ) )
    {
        die("Missing required argument: $arg");
    }

    return $value if ( $rules->{local} );

    # there might eventually be an issue with string 1 (for numbers) vs bool 1 (for true)
    # will solve it once i see it
    if ( ( $rules->{is_string} ) && ( defined($value) ) && ( !ref($value) ) )
    {
        return $value;
    }
    elsif ( ( $rules->{is_array} ) && ( ref($value) eq 'ARRAY' ) )
    {
        return $value;
    }
    elsif ( ( $rules->{is_bool} ) && ( JSON::is_bool($value) ) )
    {
        return $value;
    }
    elsif ( ( $rules->{is_bool} ) && ( ( $value == 1 ) || ( $value == 0 ) ) )
    {
        return $value ? JSON::true : JSON::false;
    }
    else
    {
        my $possible;
        while ( my ( $k, $v ) = each(%$rules) )
        {
            $possible .= $k =~ s/^is_// if ( $k =~ /^is_/ ) . ', ';
        }
        $possible =~ s/\,\s+$//;
        die("Invalid option data value.  $arg supports $possible");
    }

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
