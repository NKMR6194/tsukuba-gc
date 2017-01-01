# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tsukuba/gc/version'

Gem::Specification.new do |spec|
  spec.name          = "tsukuba-gc"
  spec.version       = Tsukuba::GC::VERSION
  spec.authors       = ["SAKATA Sinji"]
  spec.email         = ["sinji@sakasin.net"]

  spec.summary       = "Scan the schedule of garbage collection in Tsukuba from PDF."
  spec.description   = "Scan the schedule of garbage collection in Tsukuba from PDF."
  spec.homepage      = "https://github.com/NKMR6194/tsukuba-gc"
  spec.licenses      = ["MIT"]

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = Gem::Requirement.new(">= 2.2.0")

  spec.add_dependency "rmagick", "~>2.16.0"
  spec.add_dependency "activesupport", "~>5.0.1"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
