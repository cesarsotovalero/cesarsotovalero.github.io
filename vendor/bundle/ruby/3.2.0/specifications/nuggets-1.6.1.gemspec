# -*- encoding: utf-8 -*-
# stub: nuggets 1.6.1 ruby lib

Gem::Specification.new do |s|
  s.name = "nuggets".freeze
  s.version = "1.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jens Wille".freeze]
  s.date = "2022-05-18"
  s.description = "Various extensions to Ruby classes.".freeze
  s.email = "jens.wille@gmail.com".freeze
  s.extra_rdoc_files = ["README".freeze, "COPYING".freeze, "ChangeLog".freeze]
  s.files = ["COPYING".freeze, "ChangeLog".freeze, "README".freeze]
  s.homepage = "http://github.com/blackwinter/nuggets".freeze
  s.licenses = ["AGPL-3.0".freeze]
  s.post_install_message = "\nnuggets-1.6.1 [2022-05-18]:\n\n* Ruby 3.1 compatibility.\n\n".freeze
  s.rdoc_options = ["--title".freeze, "nuggets Application documentation (v1.6.1)".freeze, "--charset".freeze, "UTF-8".freeze, "--line-numbers".freeze, "--all".freeze, "--main".freeze, "README".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Extending Ruby.".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<mime-types>.freeze, [">= 0"])
  s.add_development_dependency(%q<open4>.freeze, [">= 0"])
  s.add_development_dependency(%q<hen>.freeze, ["~> 0.9", ">= 0.9.1"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
end
