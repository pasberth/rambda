require 'rambda/itself'
require 'rambda/message'

module Rambda

  class Body < BasicObject

    private *instance_methods
    private

    def initialize(receiver, params, args)
      @receiver = receiver
      @params = params
      @args = args
    end

    def method_missing(name, *args, &block)
      case name
      when *@params
        if args.empty? and block.nil?
          Itself.new(@args[@params.index(name)])
        else
          Message.new(@args[@params.index(name)], :call, *args, &block)
        end
      else
        Message.new(@receiver, name, *args, &block)
      end
    end

    def literal(val)
      Itself.new(val)
    end

    def to_proc
      ->(*args, &block) { instance_exec(*args, &block) }
    end
  end
end
