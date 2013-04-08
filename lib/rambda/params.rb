require 'rambda/rambda'

module Rambda

  class Params < BasicObject

    protected *instance_methods
    protected

    def initialize(receiver, params)
      @receiver = receiver
      @params = params
    end

    def method_missing(param, &block)
      if block
        Rambda.new(@receiver, [*@params, param], [], block)
      else
        Params.new(@receiver, [*@params, param])
      end
    end
  end
end
