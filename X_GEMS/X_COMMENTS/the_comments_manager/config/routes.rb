module TheCommentsManager
  # TheCommentsManager::Routes.mixin(self)

  class Routes
    def self.mixin mapper
      mapper.extend ::TheCommentsManager::DefaultRoutes
      mapper.send :comments_manager_routes
    end
  end

  module DefaultRoutes
    def comments_manager_routes
      resources :comments, only: %w[ edit update ] do
        collection do
          get :manage
          get :my_comments

          get :draft
          get :published
          get :deleted
          get :spam

          get :my_draft
          get :my_published
          get :my_deleted
          get :my_spam

          get :total_draft
          get :total_published
          get :total_deleted
          get :total_spam
        end

        member do
          post   :to_spam
          post   :to_draft
          post   :to_published
          delete :to_deleted
        end
      end
    end
  end
end

