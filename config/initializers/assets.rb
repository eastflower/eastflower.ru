# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %W[
  user_room_mailer.css
  user_room.css
  user_room.js

  rails_blog_backend.js
  rails_blog_frontend.js

  rails_blog_backend.css
  rails_blog_frontend.css

  rails_shop_backend.js
  rails_shop_frontend.js

  rails_shop_backend.css
  rails_shop_frontend.css

  mailers/app_layout.css

  app_view/mailers/base_styles.css
]