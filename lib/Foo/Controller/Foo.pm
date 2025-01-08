package Foo::Controller::Foo;

use v5.38;
use Mojo::Base 'Mojolicious::Controller', -async_await;

use Local::Exceptions;

# use Struct::Dumb;

async sub foo ($self) {
    # die Local::Exceptions->new;
}
