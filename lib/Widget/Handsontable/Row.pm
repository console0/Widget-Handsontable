package Widget::Handsontable::Row;

our $AUTOLOAD;

sub __new 
{
    my ($class, $columns) = @_;
    my $self = {};
    bless ($self, $class);
    $self->{__columns} = $columns;
    return $self;
}

sub AUTOLOAD 
{
    my ($self, $value) = @_;
    my $colname = $AUTOLOAD;
    # set col OR set col method
    if (defined($value))
    {
        if (ref($value) eq 'CODE')
        {
            $self->{'__m' . $colname} = $value;
        }
        else
        {
            $self->{'__v' . $colname} = $value;
        }
    }

    $self->{'__m' . $colname} ? return $self->{'__m' . $colname}() : return $self->{'__v' . $colname};
}

sub serialize
{
    my ($self, %args) = @_;

    my @data;
    foreach my $column (@{$self->{__columns}})
    {
        my $colname = $column->{name};
        push(@data,$self->$colname);
    } 
    return \@data;
}

1;
