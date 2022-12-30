require "has_meta_data/version"

module HasMetaData
  class Engine < Rails::Engine; end
end

_root_ = File.expand_path('../../', __FILE__)
require "#{ _root_ }/config/routes"
