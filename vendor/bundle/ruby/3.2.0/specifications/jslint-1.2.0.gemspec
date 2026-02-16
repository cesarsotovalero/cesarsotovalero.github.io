# -*- encoding: utf-8 -*-
# stub: jslint 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jslint".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Geraud Boyer".freeze]
  s.date = "2012-05-16"
  s.description = "This gem provides an easy way to use jslint with your programs.  It comes with rhino and it will use nodes.js if it is present.".freeze
  s.email = "geraud@gmail.com".freeze
  s.executables = ["jslint".freeze]
  s.extra_rdoc_files = ["LICENSE".freeze, "README.md".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze, "bin/jslint".freeze]
  s.homepage = "http://github.com/geraud/jslint".freeze
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Wrapping of jslint".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 3

  s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
end
