namespace :jslint do

  desc 'Run JSlint against the directories specified in config/jslint.yml'
  task :check do

  end

end

def jslint_config
  configuration_file = File.join(Rails.root, 'config/jslint.yml')
  if File.exists? configuration_file
    config = YAML.load_file(configuration_file)[source].symbolize_keys
  else
    $stderr.puts "config/jslint.yml' not found try rails g jslint:update_config"
    exit 1
  end
end
