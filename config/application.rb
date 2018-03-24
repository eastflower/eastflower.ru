require File.expand_path('../boot', __FILE__)
RAILS_ROOT = File.expand_path('../../', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

voiceless {
  ::ActiveRecord::Base.raise_in_transactional_callbacks = true
}

require_relative 'app_errors'

module HakushuIo
  class Application < Rails::Application
    require_relative 'app_theme/configs'
    require_relative 'app_theme/databases'
    require_relative 'app_theme/view_paths'

    # Custom Errors Handling
    # -> ./app_errors.rb
    # -> /app/controllers/errors_controller
    config.exceptions_app = ->(env) { ErrorsController.action(:show).call(env) }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # ***************************************
    # set App View Paths
    # ***************************************
    #
    initializer :add_app_view_paths do
      ::AppThemeViewPaths.add_assets(self)

      ActiveSupport.on_load(:action_controller) do
        ::AppThemeViewPaths.add_views(self)
      end
    end
    # ***************************************
  end
end
