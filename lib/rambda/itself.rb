require 'rambda/message'

module Rambda

  class Itself < BasicObject
    protected *instance_methods
    protected

    def initialize(receiver)
      @receiver = receiver
    end

    def method_missing(name, *args, &block)
      Message.new(@receiver, name, *args, &block)
    end

    def to_proc
      -> { @receiver }
    end
  end
end
