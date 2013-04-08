# -*- coding: utf-8 -*-
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

    alias λ rambda
  end
end

