require 'rambda/itself'
require 'rambda/message'
require 'rambda/body'

module Rambda

  class Rambda

    def initialize(receiver, params, args, block)
      @receiver = receiver
      @params = params
      @args = args 
      @block = block
    end

    def arity
      @params.size
    end

    def call(*args, &block)
      args << block if block
      args = @args + args

      if arity > args.size
        Rambda.new(@receiver, @params, args, @block)
      else
        args, rest = args[0, arity], args[arity..-1]
        r = lambda(&Body.new(@receiver, @params, args)).(&@block)
        case r
        when Itself
          lambda(&r).()
        when Message
          lambda(&r).(*rest)
        else
          r
        end
      end
    end
  end
end
