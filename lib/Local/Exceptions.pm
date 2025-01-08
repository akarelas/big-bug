package Local::Exceptions;

use v5.38;

use Data::Dump 'dump';

sub new ($class) {
    bless {}, $class;
}

use overload '""' => sub {
    # 'fudge';
    return dump('hi');
};
