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

      ->(*args) { r.send(@name, *@args, *args, &@block) }
    end
  end
end
