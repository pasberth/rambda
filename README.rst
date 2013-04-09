Rambda
================================================================================

Examples
--------------------------------------------------------------------------------

.. code:: ruby

  require 'rambda'
  include Rambda::Mixin

  f = λ.x.y{x}
  f.(1, 2) # => 1
  f.(1).(2) # => 1

  inc = λ{literal(1).+}
  inc.(42) # => 43

  hello = λ{print "hello "}
  hello.("world") # => hello world

  cons = rambda.a.b.f{f(a, b)}
  car = rambda.x.y{x}
  cdr = rambda.x.y{y}
  l = cons.(1, cons.(2,3))
  l.(car) # => 1
  l.(cdr).(car) # => 2
  l.(cdr).(cdr) # => 3

Installation
--------------------------------------------------------------------------------

.. code:: sh

  gem install rambda
