# Review

## Startup

Yay, it works cleanly.  Thanks.

## Tests

Generally, we don't want master's tests to ever fail.  Pending, OK; Passing,
OK.  cf. changes to see how I got them to all pass

The coverage is great.  There are some usage patterns that I think you could
take up that would make the tests look more RSpec like.  Specifically things
like using let() and making sure that you're only using before(:each) to set up
the minimal amount would be recommended.  I think the tests you did here could
be refactored for some real insights.  Maybe try to get the tests passing on
your own.

I'm seeing a lot of setup in before(:each)and that's a worrying sighn to me.
it implies tha tyou're not using the testing framework to its full potential.

The question is how much setup is too much setup in the before bloks.  Part of
the goal of TDD is to make sure that your tests can be run in isolation or can
be run successfully with mock objects.  If you detect that you have to do a lot
of setup to get a test to pass, it's a sign tha tyour controller methods are
too complex or that they have too many dependencies.

_ententia non multiplicanda sunt_

## Migrations

Nicely done with constraints.

## Controllers

* We played with OO a good bit
* Also gained the ability to use AR to help set foreign keys, etc.
* Pay attention to enumerables

## Views

* Nice, good use of partials
* Also note that fixing the AR on the controller allows for simpler views,
  fewer hidden methods

