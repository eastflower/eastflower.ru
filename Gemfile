source 'https://rubygems.org'

gem 'rails'

# APP THEME
gem 'app_view_engine', path: "X_GEMS/EASTFLOWER/eastflower_ru_view"

# DATABASES
gem 'pg', '0.18'
gem 'mysql2', '~> 0.3.18'

# SEARCH
gem 'thinking-sphinx', '~> 3.1', '>= 3.1.4'
gem 'pg_search'

# WEB SERVER
gem 'puma'
# gem 'unicorn-rails'

# CONFIGURATION
gem 'config', '1.0.0'

# DELAYED JOBS
gem 'sidekiq'
gem 'sidekiq-limit_fetch'

gem 'redis-namespace'
gem 'sinatra', require: nil

# CRON TASKS
gem 'whenever'

# VIEW
gem 'sass-rails' #, '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'jquery-ui-rails', '5.0.5'

gem 'turbolinks'

# gem 'turbolinks', '~> 5.0.0.beta2'
# ^^^ need for debug

gem 'oj'
gem 'jbuilder', '~> 2.0'

gem 'truncato'
gem 'slim-rails'

gem 'autoprefixer-rails'
gem 'compass-rails', github: 'Compass/compass-rails'

# MODEL
gem 'acts-as-taggable-on', '~> 3.5'

gem 'awesome_nested_set',
  github: 'collectiveidea/awesome_nested_set',
  branch: 'master'

# EMAILs & MAILER
gem 'gibbon'
gem 'actionview-encoded_mail_to'

# ERRORS PROCESSING
gem 'rollbar'
gem 'newrelic_rpm'
gem 'exception_notification'

# X_GEMS
gem 'user_room',  path: './X_GEMS/USER_ROOM'
gem 'rails_blog', path: './X_GEMS/RAILS_BLOG'
gem 'rails_shop', path: './X_GEMS/RAILS_SHOP'

gem 'protozaur',               path: './X_GEMS/gem/protozaur'
gem 'protozaur_theme',         path: './X_GEMS/gem/protozaur_theme'
gem 'ptz_tabs',                path: './X_GEMS/gem/ptz_tabs'

gem 'db_bootstrap', path: './X_GEMS/gem/db_bootstrap'
gem 'components',   path: './X_GEMS/gem/components'
gem 'voiceless',    path: './X_GEMS/gem/voiceless'

gem 'jody',             path: './X_GEMS/gem/jody'
gem 'jsvoid',           path: './X_GEMS/gem/jsvoid'

gem 'log_js',           path: './X_GEMS/gem/log_js'
gem 'pagination',       path: './X_GEMS/gem/pagination'
gem 'simple_sort',      path: './X_GEMS/gem/simple_sort'

gem 'role_slim_js',     path: './X_GEMS/gem/role_slim_js'
gem 'notifications',    path: './X_GEMS/gem/notifications'
gem 'has_meta_data',    path: './X_GEMS/gem/has_meta_data'

gem 'to_slug_param',    path: './X_GEMS/gem/to_slug_param'
gem 'friendly_id_pack', path: './X_GEMS/gem/friendly_id_pack'
gem 'the_string_addon', path: './X_GEMS/gem/the_string_addon'

gem 'image_tools',       path: './X_GEMS/gem/image_tools'
gem 'crop_tool',         path: './X_GEMS/gem/crop_tool'
gem 'attached_images',   path: './X_GEMS/gem/attached_images'
gem 'the_storages',      path: './X_GEMS/gem/the_storages'

gem 'the_sortable_tree', path: './X_GEMS/gem/the_sortable_tree'

# THE COMMENTS
gem 'the_comments_base',
  path: './X_GEMS/X_COMMENTS/the_comments_base'

gem 'the_comments_antispam_services',
  path: './X_GEMS/X_COMMENTS/the_comments_antispam_services'

gem 'the_comments_subscriptions',
  path: './X_GEMS/X_COMMENTS/the_comments_subscriptions'

gem 'the_comments_manager',
  path: './X_GEMS/X_COMMENTS/the_comments_manager'

# OAUTH FIXED VERSIONS FOR USER ROOM

gem 'omniauth',        '1.2.2'
gem 'omniauth-oauth',  '1.0.1'
gem 'omniauth-oauth2', '1.2.0'

gem 'omniauth-facebook',      '2.0.0'
gem 'omniauth-vkontakte',     '1.3.2'
gem 'omniauth-google-oauth2', '0.2.5'
gem 'omniauth-odnoklassniki', '0.0.4'
gem 'omniauth-twitter',       '1.0.1'

group :development do
  gem 'spring'
  gem 'ffaker'

  # Mailcatchers
  gem 'letter_opener'
  gem 'mailcatcher'

  gem 'web-console', '~> 2.0'
  gem 'seedbank', github: 'james2m/seedbank'
end

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'

  gem 'byebug'
  gem 'quiet_assets'

  gem 'better_errors'
  gem 'binding_of_caller'
end
