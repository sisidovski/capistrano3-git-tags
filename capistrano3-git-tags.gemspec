# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano3/git/tags/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano3-git-tags"
  spec.version       = Capistrano3::Git::Tags::VERSION
  spec.authors       = ["sisidovski"]
  spec.email         = ["sisidovski@gmail.com"]
  spec.summary       = %q{Create and push git tag Automatically when deploying with capistrano3}
  spec.description   = %q{Create and push git tag Automatically when deploying with capistrano3}
  spec.homepage      = "https://github.com/sisisdovski/capistrano3-git-tags"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
