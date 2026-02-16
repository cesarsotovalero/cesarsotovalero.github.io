module Jslint
  RhinoJar = File.expand_path('../js-1.7R2.jar', __FILE__)
  Scripts = {}
  Dir["#{File.expand_path('../../jslint', __FILE__)}/*.js"].each do |file_name|
    Scripts[File.basename(file_name, '.js').to_sym] = file_name
  end
end
require 'jslint/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
