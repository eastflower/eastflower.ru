module TheCommentsManager
  module Generators
    class ViewsGenerator < Rails::Generators::NamedBase
      source_root TheCommentsManager::Engine.root

      def self.banner
<<-BANNER.chomp

USAGE: [bundle exec] rails g the_comments_manager:views OPTION_NAME

> rails g the_comments_manager:views js
> rails g the_comments_manager:views css
> rails g the_comments_manager:views assets

> rails g the_comments_manager:views views
> rails g the_comments_manager:views all

BANNER
      end

      def copy_sortable_tree_files
        copy_gem_files
      end

      private

      def param_name
        name.downcase
      end

      def copy_gem_files
        case param_name
          when 'js'
            # rails g the_comments_manager:views js
            js_copy
          when 'assets'
            # rails g the_comments_manager:views assets
            js_copy
          when 'views'
            # rails g the_comments_manager:views views
            views_copy
          when 'all'
            js_copy
            views_copy
          else
            puts 'TheCommentsManager View Generator - wrong Name'
            puts "Wrong params - use only [ js | assets | views | all ] values"
        end
      end

      def js_copy
        d1 = "app/assets/javascripts"
        directory d1, d1
      end

      def views_copy
        d1 = "app/views/the_comments"
        directory d1, d1
      end
    end
  end
end
