lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "class_names/version"

Gem::Specification.new do |spec|
  spec.name          = "class_names"
  spec.version       = ClassNames::VERSION
  spec.authors       = ["Harris Thompson"]
  spec.email         = ["hthompson@abodo.com"]

  spec.summary       = %q{A simple helper to conditionally join class names together}
  spec.description   = %q{The class_names function takes any number of arguments which can be a string or hash. The argument 'foo' is short for { foo: true }. If the value associated with a given key is falsy (nil or false), that key won't be included in the output.}
  spec.homepage      = "https://github.com/abodo-dev/class_names"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/abodo-dev/class_names"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
