module AppViewEngine
  # ::AppViewEngine::Routes.mixin(self)
  class Routes
    def self.mixin mapper
      mapper.extend ::AppViewEngine::DefaultRoutes
      mapper.send :app_view_routes
    end
  end

  module DefaultRoutes
    def app_view_routes
      root 'welcome#index'
    end
  end
end