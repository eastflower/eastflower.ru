module AppThemeViewPaths
  def self.add_assets ctx
    puts ">>> APPEND ASSETS THEME <<<"

    if defined? ::AppViewEngine
      _views_root_ = ::AppViewEngine::Engine.config.root

      assets = [
        'app/assets/images',
        'app/assets/javascripts',
        'app/assets/stylesheets',
        'vendor/assets/javascripts'
      ]

      assets.each do |assets_path|
        ::HakushuIo::Application.config.assets.paths.unshift("#{ _views_root_ }/#{ assets_path }")
      end
    else
      puts '*'*50
      puts "AppViewEngine for ASSETS not found"
      puts '*'*50
    end
  end

  def self.add_views ctx
    puts ">>> APPEND VIEWS THEME <<<"

    _root_  = ::HakushuIo::Application.config.root

    views = [
      'app/views',
      'app/views/app',
      'app/views/app_view',
      'app/views/user_room',
      'app/views/rails_blog',
      'app/views/rails_shop',
      'app/views/rails_search',
      'app/views/the_comments'
    ].reverse

    if respond_to?(:prepend_view_path)
      views.each do |view_path|
        prepend_view_path("#{ _root_ }/#{ view_path }" )
      end
    end

    if defined? ::AppViewEngine
      _views_root_ = ::AppViewEngine::Engine.config.root

      if ctx.respond_to?(:prepend_view_path)
        views.each do |view_path|
          ctx.prepend_view_path("#{ _views_root_ }/#{ view_path }" )
        end
      end
    else
      puts '*'*50
      puts "AppViewEngine for VIEWS not found"
      puts '*'*50
    end
  end
end