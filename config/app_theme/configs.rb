# ***************************************
# gem `config` for Rails
# ***************************************
#
Config::Integration::Rails::Railtie.preload
app = Rails.application

puts path_1 = "#{ app.config.root }/config/_CONFIGS/#{ ::Rails.env }/settings/*.yml"
puts path_2 = "#{ app.config.root }/config/ENV/#{ ::Rails.env }/settings/*.yml"
puts path_3 = "#{ app.config.root }/config/settings/*.yml"
puts '=*'*20

Dir[ path_1, path_2, path_3 ].each do |settings_file|
  Settings.add_source!(settings_file)
  puts 'Settings: LOAD FILE => `' + settings_file + '`'
end

Settings.reload!
# ***************************************
