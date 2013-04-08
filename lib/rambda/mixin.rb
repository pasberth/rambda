require 'rambda'

module Rambda

  module Mixin

    def rambda(&block)
      if block_given?
        Rambda.new(self, [], [], block).()
      else
        Params.new(self, [])
      end
    end
  end
end

