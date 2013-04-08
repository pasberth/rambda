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

Installation
--------------------------------------------------------------------------------

.. code:: sh

  gem install rambda
