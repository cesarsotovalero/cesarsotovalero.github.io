# -*- encoding: utf-8 -*-
# stub: jekyll-bits 0.15 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-bits".freeze
  s.version = "0.15"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yegor Bugayenko".freeze]
  s.date = "2018-09-06"
  s.description = "Useful and very simple Jekyll plugins".freeze
  s.email = "yegor256@gmail.com".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "http://github.com/yegor256/jekyll-bits".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Jekyll Bits".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 2

  s.add_runtime_dependency(%q<fastimage>.freeze, [">= 0"])
  s.add_development_dependency(%q<jekyll>.freeze, ["= 3.4.0"])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.5"])
  s.add_development_dependency(%q<coveralls>.freeze, ["= 0.7.0"])
  s.add_development_dependency(%q<test-unit>.freeze, ["= 3.0.8"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rdoc>.freeze, ["= 3.11"])
  s.add_development_dependency(%q<rubocop>.freeze, ["= 0.46.0"])
  s.add_development_dependency(%q<rubocop-rspec>.freeze, ["= 1.8.0"])
end
