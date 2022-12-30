module HasMetaData
  # HasMetaData::Routes.mixin(self)
  class Routes
    def self.mixin mapper
      mapper.extend ::HasMetaData::DefaultRoutes
      mapper.send :meta_data_routes
    end
  end

  module DefaultRoutes
    def meta_data_routes
      resources :meta_datum
    end
  end
end
