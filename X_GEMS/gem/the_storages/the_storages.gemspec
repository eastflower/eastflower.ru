# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'the_storages/version'

Gem::Specification.new do |spec|
  spec.name          = "the_storages"
  spec.version       = TheStorages::VERSION
  spec.authors       = ["Ilya N. Zykin"]
  spec.email         = ["zykin-ilya@ya.ru"]
  spec.description   = %q{TheStorages - act as file storage}
  spec.summary       = %q{easy file attaching to any AR Model}
  spec.homepage      = "https://github.com/the-teacher"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'slim'
  spec.add_dependency 'haml'
  spec.add_dependency 'log_js'
  spec.add_dependency 'paperclip'
  spec.add_dependency 'image_tools'
  spec.add_dependency 'to_slug_param'
  spec.add_dependency 'the_sortable_tree'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
