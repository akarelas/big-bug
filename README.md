## TO SEE THE BUG

install the modules with Carton, and launch the website with ./launch.pl

Visit the website's /foo page

The first time you visit the page after the site launches, you will see a weird error message (this is the bug).

The second as well as all further times you visit the page, the expected output appears.

The bug will not manifest itself if **EITHER** (i.e. **ANY**) of all the following happens:

1. async await is taken away from the hook in /lib/Foo.pm
i.e. if you turn this:

```perl
await async sub {
    die Local::Exceptions->new;
}->();
```

...into this:

```perl
sub {
    die Local::Exceptions->new;
}->();
```

2. The `use Struct::Dumb` line in lib/Foo.pm (which isn't used anywhere) is commented-out

3. `dump` in Local::Exceptions is replaced with a plain string
4. You don't stringify the Exception in the standard way (`use overload '""'`)
but by calling a to_string method on the Exception (which you'd have to define).
5. I BELIEVE I tried well-enough to create the same set-up as a non-website script
(using `Mojo::Base -strict, -async_await`), and even then the bug didn't manifest itself either
(though not sure I tried it well enough).

I believe this is one of the strangest, weirdest bugs of all time, because it requires all of the above
components for it to manifest.