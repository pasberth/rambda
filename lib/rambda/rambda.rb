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

    def call(*args, &block)
      args << block if block

      if @params.size > (@args + args).size
        Rambda.new(@receiver, @params, (@args + args), @block)
      else
        r = lambda(&Body.new(@receiver, @params, (@args + args))).(&@block)
        case r
        when Itself
          lambda(&r).()
        when Message
          lambda(&r)
        else
          r
        end
      end
    end
  end
end
