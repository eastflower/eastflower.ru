app = Rails.application

app.config.active_job.queue_adapter = :sidekiq

# Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
# Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.

# Change TimeZone on Debian Server [root/sudo]
# cp /etc/localtime /etc/localtime.backup
# ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
# Server time should be set according to time zone of majority visitors
app.config.time_zone = Settings.app.time_zone

# The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
# config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
app.config.i18n.default_locale = Settings.app.default_locale

# Do not swallow errors in after_commit/after_rollback callbacks.
app.config.active_record.raise_in_transactional_callbacks = true

app.config.autoload_paths += %W[ #{ app.config.root }/app/mailers/concerns/** ]

# RAILS APP secrets
app.config.secret_key_base = Settings.app.secret_key_base
app.config.secret_token    = Settings.app.secret_token

# Be sure to restart your server when you modify this file.

# This file contains settings for ActionController::ParamsWrapper which
# is enabled by default.

# Enable parameter wrapping for JSON. You can disable this by setting :format to an empty array.
ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: [:json] if respond_to?(:wrap_parameters)
end

# To enable root element in JSON for ActiveRecord objects.
# ActiveSupport.on_load(:active_record) do
#  self.include_root_in_json = true
# end

# Be sure to restart your server when you modify this file.
app.config.session_store :cookie_store, key: '_hakushu_io_session'

# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
app.config.filter_parameters += [:password]

# Be sure to restart your server when you modify this file.

app.config.action_dispatch.cookies_serializer = :json

# Be sure to restart your server when you modify this file.

# You can add backtrace silencers for libraries that you're using but don't wish to see in your backtraces.
# Rails.backtrace_cleaner.add_silencer { |line| line =~ /my_noisy_library/ }

# You can also remove all the silencers if you're trying to debug a problem that might stem from framework code.
# Rails.backtrace_cleaner.remove_silencers!