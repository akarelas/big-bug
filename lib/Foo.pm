package Foo;

use v5.38;
use Mojo::Base 'Mojolicious', -async_await;

use Local::Exceptions;

use Safe::Isa;
use Struct::Dumb;

use experimental 'try';

# This method will run once at server start
sub startup ($self) {
  $self->hook(around_action => async sub ($next, $c, $action, $last) {
    try {
      await async sub {
        die Local::Exceptions->new;
      }->();
    } catch ($err) {
      $c->render(text => "Error: $err");
    };
  });

  # Router
  my $r = $self->routes;
  $r->get('/foo')->to('foo#foo');
}

1;
