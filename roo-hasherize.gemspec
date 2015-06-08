lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roo/hasherize/version'

Gem::Specification.new do |spec|
  spec.name = 'roo-hasherize'
  spec.version = Roo::Hasherize::VERSION::STRING
  spec.authors = ['Vasiliy Yorkin']
  spec.email = ['vasiliy.yorkin@gmail.com']

  spec.summary = "roo-hasherize-#{Roo::Hasherize::VERSION::STRING}"
  spec.description = 'Meaningful spreadsheet access'
  spec.homepage = 'https://github.com/vyorkin/roo-hasherize'

  spec.files = `git ls-files -- lib/*`.split("\n")
  spec.files += %w(README.md LICENSE)
  spec.bindir = 'exe'
  spec.executables = `git ls-files -- exe/*`.split("\n").map { |file| File.basename(file) }

  spec.test_files = []
  spec.require_path = 'lib'
  spec.license = 'MIT'

  spec.add_runtime_dependency 'roo', '~> 2.0', '>= 2.0.0'
  spec.add_runtime_dependency 'roo-xls', '~> 1.0', '>= 1.0.0'
  spec.add_runtime_dependency 'activesupport', '>= 3.0', '< 5.0'

  spec.add_development_dependency 'bundler', '~> 1.7', '>= 1.7.6'
  spec.add_development_dependency 'rake', '~> 10.0', '>= 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2', '>= 3.2.0'
  spec.add_development_dependency 'rspec-its', '~> 1.2', '>= 1.2.0'
  spec.add_development_dependency 'yard', '~> 0.8', '>= 0.8.7'
  spec.add_development_dependency 'yard-rspec', '~> 0.1', '>= 0.1'
  spec.add_development_dependency 'simplecov', '~> 0.10', '>= 0.10.0'
end
