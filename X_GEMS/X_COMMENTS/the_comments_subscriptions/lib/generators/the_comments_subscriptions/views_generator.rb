module TheCommentsSubscriptions
  module Generators
    class ViewsGenerator < Rails::Generators::NamedBase
      source_root TheCommentsSubscriptions::Engine.root

      def self.banner
<<-BANNER.chomp

USAGE: [bundle exec] rails g the_comments_subscriptions:views OPTION_NAME

> rails g the_comments_subscriptions:views install

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
          when 'install'
            # rails g the_comments_subscriptions:views install
            views_copy
          when 'views'
            # rails g the_comments_subscriptions:views views
            views_copy
          when 'all'
            # rails g the_comments_subscriptions:views all
            views_copy
          else
            puts 'TheCommentsSubscriptions View Generator - wrong Name'
            puts "Wrong params - use only [ js | css | assets | views | helper | all ] values"
        end
      end

      def views_copy
        d1 = "app/views/the_comments"
        directory d1, d1
      end

    end
  end
end
