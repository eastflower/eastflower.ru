require "app_view_engine/version"

module AppViewEngine
  # AppViewEngine.view_name
  def self.view_name
    :eastflower
  end

  class Engine < Rails::Engine
    config.autoload_paths << "#{ config.root }/app/mailers/concerns/"

    initializer "Eastflower: static assets" do |app|
      app.middleware.use(::ActionDispatch::Static, "#{ config.root }/public")
    end
  end
end

_root_ = File.expand_path('../../', __FILE__)
require "#{ _root_ }/config/routes"