class TheCommentsManagerGenerator < Rails::Generators::NamedBase
  source_root TheCommentsManager::Engine.root
  # source_root File.expand_path('../templates', __FILE__)
  # argument :xname, type: :string, default: :xname

  # > rails g the_comments_manager OPTION_NAME
  def generate_controllers
    case gen_name
      when 'install'
        # > rails g the_comments_manager install
        cp_controllers
      when 'controllers'
        # > rails g the_comments_manager controllers
        cp_controllers
      when 'locales'
        # > rails g the_comments_manager locales
        cp_locales
      when 'all'
        # > rails g the_comments_manager all
        cp_controllers
        cp_locales
      else
        puts 'TheComments Generator - wrong Name'
        puts 'Try to use [ install | controllers | locales | all ]'
    end
  end

  private

  # def root_path; TheCommentsManager::Engine.root; end

  def gen_name
    name.to_s.downcase
  end

  def cp_controllers
    d1 = "app/controllers/concerns"
    directory d1, d1
  end

  def cp_locales
    d1 = "config/locales"
    directory d1, d1
  end
end
