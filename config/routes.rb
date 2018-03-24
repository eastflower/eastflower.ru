require 'sidekiq/web'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == 'admin' && password == 'qwerty12345'
end

Rails.application.routes.draw do
  mount Sidekiq::Web => '/async/tasks'

  # get '/page_404' => 'errors#page_404', as: :page_404
  %w[ bug detect_403 detect_404 detect_422 detect_500 ].each do |page|
    get page => "exceptions##{ page }"
  end

  # AppSubscriptionsController
  post '/app_sbuscribe' => 'app_subscriptions#app_sbuscribe', as: :app_sbuscribe

  if defined? ::AppViewEngine
    ::AppViewEngine::Routes.mixin(self)
  end

  ::UserRoom::Routes.mixin(self)
  ::RailsBlog::Routes.mixin(self)

  ::HasMetaData::Routes.mixin(self)
  ::AttachedImages::Routes.mixin(self)

  ::TheCommentsBase::Routes.mixin(self)
  ::TheCommentsManager::Routes.mixin(self)
  ::TheCommentsSubscriptions::Routes.mixin(self)

  if defined? ::RailsShop
    ::RailsShop::Routes.mixin(self)
  end

  if defined? ::RailsSearchEngine
    ::RailsSearchEngine::Routes.mixin(self)
  end
end