# ***************************************
# gem `config` for Rails
# ***************************************
#
Config::Integration::Rails::Railtie.preload
app = Rails.application

Dir[
  "#{ app.config.root }/config/_CONFIGS/#{ ::Rails.env }/settings/*.yml",
  "#{ app.config.root }/ENV/#{ ::Rails.env }/settings/*.yml",
  "#{ app.config.root }/config/settings/*.yml"
].each do |settings_file|
  Settings.add_source!(settings_file)
  puts 'Settings: LOAD FILE => `' + settings_file + '`'
end

Settings.reload!
# ***************************************
