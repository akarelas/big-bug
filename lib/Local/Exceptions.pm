package Local::Exceptions;

use v5.38;

use Data::Dump 'dump'; # needed for the bug to manifest

sub new ($class) {
    bless {}, $class;
}

# stringification overload is needed for the bug to manifest
use overload '""' => sub {
    return dump('hi');
};
