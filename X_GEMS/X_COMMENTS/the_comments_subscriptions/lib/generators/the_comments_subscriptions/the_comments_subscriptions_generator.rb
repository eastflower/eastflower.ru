class TheCommentsSubscriptionsGenerator < Rails::Generators::NamedBase
  source_root TheCommentsSubscriptions::Engine.root
  # source_root File.expand_path('../templates', __FILE__)
  # argument :xname, type: :string, default: :xname

  # > rails g the_comments_subscriptions OPTION_NAME
  def generate_controllers
    case gen_name
      when 'install'
        # > rails g the_comments_subscriptions install
        cp_models
        cp_controllers
      when 'models'
        # > rails g the_comments_subscriptions models
        cp_models
      when 'controllers'
        # > rails g the_comments_subscriptions controllers
        cp_controllers
      when 'mailers'
        # > rails g the_comments_subscriptions mailers
        cp_mailers
      when 'jobs'
        # > rails g the_comments_subscriptions jobs
        cp_jobs
      when 'locales'
        # > rails g the_comments_subscriptions locales
        cp_locales
      when 'all'
        # > rails g the_comments_subscriptions all
        cp_models
        cp_controllers
        cp_mailers
        cp_jobs
        cp_locales
      else
        puts 'TheCommentsSubscriptions Generator - wrong Name'
        puts 'Try to use [ install | models | controllers | mailers | jobs | locales | all ]'
    end
  end

  private

  # def root_path; TheCommentsSubscriptions::Engine.root; end

  def gen_name
    name.to_s.downcase
  end

  def cp_models
    directory "app/models/_templates_", "app/models"
  end

  def cp_controllers
    directory "app/controllers/_templates_", "app/controllers"
  end

  def cp_mailers
    d1 = "app/mailers"
    directory d1, d1
  end

  def cp_jobs
    d1 = "app/jobs"
    directory d1, d1
  end

  def cp_locales
    d1 = "config/locales"
    directory d1, d1
  end
end
