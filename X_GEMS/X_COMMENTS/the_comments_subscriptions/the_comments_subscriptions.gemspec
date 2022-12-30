# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'the_comments_subscriptions/version'

Gem::Specification.new do |spec|
  spec.name          = "the_comments_subscriptions"
  spec.version       = TheCommentsSubscriptions::VERSION
  spec.authors       = ["Ilya N. Zykin"]
  spec.email         = ["zykin-ilya@ya.ru"]
  spec.summary       = %q{TheComments platform. Subscriptions}
  spec.description   = %q{Please, let me know about new comments}
  spec.homepage      = "https://github.com/TheComments/the_comments_subscriptions"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'the_comments_base'
  spec.add_dependency 'activejob', '~> 4.2.0'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
