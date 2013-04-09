require 'rambda'

describe "#rambda" do

  include Rambda::Mixin

  example do
    t = rambda.x.y{x}
    t.(1,2).should == 1
  end

  example do
    f = rambda.x.y{y}
    f.(1,2).should == 2
  end

  example do
    inc = rambda{literal(1).+}
    inc.(42).should == 43
  end

  example do
    crr = rambda.x{x.+}
    crr.("foo").("bar").should == "foobar"
  end

  example do
    crr = rambda{is_a?}
    crr.(self.class).should be_true
  end

  example do
    crr = rambda{send(:is_a?)}
    crr.(self.class).should be_true
  end

  example do
    crr = rambda{self.equal?}
    crr.(self).should be_true
  end

  example do
    cons = rambda.a.b.f{f(a, b)}
    car = rambda.x.y{x}
    cdr = rambda.x.y{y}
    l = cons.(1, cons.(2,3))
    l.(car).().should == 1
    l.(cdr).().(car).().should == 2
    l.(cdr).().(cdr).().should == 3
  end
end
