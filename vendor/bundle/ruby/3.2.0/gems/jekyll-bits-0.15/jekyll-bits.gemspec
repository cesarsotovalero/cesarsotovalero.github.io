# coding: utf-8
require 'English'
Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  if s.respond_to? :required_rubygems_version=
    s.required_rubygems_version = Gem::Requirement.new('>= 0')
  end
  s.rubygems_version = '2.2.2'
  s.required_ruby_version = '>= 1.9.3'
  s.name = 'jekyll-bits'
  s.version = '0.15'
  s.license = 'MIT'
  s.summary = 'Jekyll Bits'
  s.description = 'Useful and very simple Jekyll plugins'
  s.authors = ['Yegor Bugayenko']
  s.email = 'yegor256@gmail.com'
  s.homepage = 'http://github.com/yegor256/jekyll-bits'
  s.files = `git ls-files`.split($RS)
  s.test_files = s.files.grep(%r{^(test)/})
  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = ['README.md']
  s.add_runtime_dependency 'fastimage'
  s.add_development_dependency 'jekyll', '3.4.0'
  s.add_development_dependency 'bundler', '~> 1.5'
  s.add_development_dependency 'coveralls', '0.7.0'
  s.add_development_dependency 'test-unit', '3.0.8'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc', '3.11'
  s.add_development_dependency 'rubocop', '0.46.0'
  s.add_development_dependency 'rubocop-rspec', '1.8.0'
end
