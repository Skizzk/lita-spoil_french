Gem::Specification.new do |spec|
  spec.name          = "lita-spoil_french"
  spec.version       = "0.1.0"
  spec.authors       = ["Zaratan"]
  spec.email         = ["denis.pasin@gmail.com"]
  spec.description   = "It spoils a movie with etenfaitalafin.fr"
  spec.summary       = "Spoils a movie with etenfaitalafin.fr"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "htmlentities"

  spec.add_runtime_dependency "lita", ">= 4.6"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
