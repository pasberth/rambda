version = File.read("VERSION").chomp
Gem::Specification.new do |s|
  s.name = "rambda"
  s.version = version
  s.authors = ["pasberth"]
  s.description = %{A lambda DSL, supports auto currying}
  s.summary = %q{experimental release}
  s.email = "pasberth@gmail.com"
  s.homepage = "https://github.com/pasberth/rambda"
  s.require_paths = ["lib"]
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/*`.split("\n")
  s.add_development_dependency "rspec"
end