# -*- encoding: utf-8 -*-
# stub: trollop 2.9.10 ruby lib

Gem::Specification.new do |s|
  s.name = "trollop".freeze
  s.version = "2.9.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/ManageIQ/optimist/issues", "changelog_uri" => "https://github.com/ManageIQ/optimist/blob/master/History.txt", "source_code_uri" => "https://github.com/ManageIQ/optimist/" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["William Morgan".freeze, "Keenan Brock".freeze]
  s.date = "2019-11-25"
  s.description = "Trollop is a commandline option parser for Ruby that just gets out of your way.\n\n**DEPRECATION** This gem has been renamed to optimist and will no longer be supported. Please switch to optimist as soon as possible.".freeze
  s.email = "keenan@thebrocks.net".freeze
  s.homepage = "http://manageiq.github.io/optimist/".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "!    The 'trollop' gem has been deprecated and has been replaced by 'optimist'.\n!    See: https://rubygems.org/gems/optimist\n!    And: https://github.com/ManageIQ/optimist\n".freeze
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Trollop is a commandline option parser for Ruby that just gets out of your way.".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.4.3"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
  s.add_development_dependency(%q<chronic>.freeze, [">= 0"])
end
