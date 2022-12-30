_root_ = File.expand_path('../../',  __FILE__)

require "the_comments_manager/version"

require 'slim'
require 'jbuilder'
require 'kaminari'
require 'simple_sort'
require 'notifications'

module TheCommentsManager
  class Engine < Rails::Engine; end
end

# Routing cocerns loading
require "#{ _root_ }/config/routes"
