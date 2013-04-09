module Rambda

  class Message < BasicObject
    protected *instance_methods
    protected

    def initialize(receiver, name, *args, &block)
      @receiver = receiver
      @name = name
      @args = args
      @block = block
    end

    def method_missing(name, *args, &block)
      Message.new(self, name, *args, &block)
    end

    def to_proc
      case @receiver
      when Message
        r = ::Object.send(:lambda, &@receiver).()
      else
        r = @receiver
      end

      ->(*args) do
        args = @args + args
        
        arity = if r.is_a? Rambda and @name == :call then r.arity
                else r.method(@name).arity
                end
        if arity > args.size or ~arity > args.size
          lambda(&Message.new(@receiver, @name, *args, &@block))
        elsif arity < 0
          ->(*xs) { r.send(@name, *args, *xs, &@block) }
        else
          r.send(@name, *args, &@block)
        end
      end
    end
  end
end
