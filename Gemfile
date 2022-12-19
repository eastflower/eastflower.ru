source 'https://rubygems.org'

gem 'rails', '4.2.11.1'

# APP THEME
gem 'app_view_engine', path: "X_GEMS/EASTFLOWER/eastflower_ru_view"

# DATABASES
gem 'pg', '0.18'
gem 'mysql2', '0.5.2'

# SEARCH
gem 'thinking-sphinx', '5.4.0'
gem 'pg_search', '2.1.2'

# WEB SERVER
gem 'puma', '3.11.2'
# gem 'unicorn-rails'

# CONFIGURATION
gem 'config', '1.0.0'

# DELAYED JOBS
gem 'sidekiq', '6.0.0.pre1'
gem 'sidekiq-limit_fetch', '3.4.0'

gem 'redis-namespace', '1.6.0'
gem 'sinatra', '1.4.8', require: nil

# CRON TASKS
gem 'whenever', '0.10.0'

# VIEW
gem 'sass-rails', '5.0.7'
gem 'uglifier',     '4.1.8'
gem 'coffee-rails', '4.1.1'

gem 'jquery-rails', '4.3.1'
gem 'jquery-ui-rails', '5.0.5'

gem 'turbolinks', '5.1.0'

# gem 'turbolinks', '~> 5.0.0.beta2'
# ^^^ need for debug

gem 'oj', '3.5.0'
gem 'jbuilder', '2.7.0'

gem 'truncato', '0.7.10'
gem 'slim-rails', '3.1.3'

gem 'autoprefixer-rails', '8.2.0'
gem 'compass-rails', '3.0.2' # github: 'Compass/compass-rails'

# MODEL
gem 'acts-as-taggable-on', '3.5.0'

gem 'awesome_nested_set', '3.1.4'
#   github: 'collectiveidea/awesome_nested_set',
#   branch: 'master'

# EMAILs & MAILER
gem 'gibbon', '3.2.0'
gem 'actionview-encoded_mail_to', '1.0.9'

gem "actionview", ">= 4.2.11.1"
gem "sprockets", ">= 3.7.2"

# ERRORS PROCESSING
gem 'rollbar', '2.15.5'
gem 'newrelic_rpm', '4.8.0.341'
gem 'exception_notification', '4.2.2'

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
  gem 'spring', '2.0.2'
  gem 'ffaker', '2.8.1'

  # Mailcatchers
  gem 'letter_opener', '1.6.0'
  gem 'mailcatcher', '0.6.5'

  gem 'web-console', '2.3.0'
  # gem 'seedbank', github: 'james2m/seedbank'
end

group :development, :test do
  gem 'pry', '0.11.3'
  gem 'pry-byebug', '3.6.0'

  gem 'byebug', '10.0.1'
  gem 'quiet_assets', '1.1.0'

  gem 'better_errors', '2.4.0'
  gem 'binding_of_caller', '0.8.0'
end
