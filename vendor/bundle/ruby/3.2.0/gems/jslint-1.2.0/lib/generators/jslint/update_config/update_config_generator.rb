require 'rails/generators'

module Jslint

  class UpdateConfigGenerator < ::Rails::Generators::Base

    def install_update_config
      copy_file('jslint.yml', 'config/jslint.yml')
    end

    def self.source_root
      File.join(File.dirname(__FILE__), 'templates')
    end

  end

end
