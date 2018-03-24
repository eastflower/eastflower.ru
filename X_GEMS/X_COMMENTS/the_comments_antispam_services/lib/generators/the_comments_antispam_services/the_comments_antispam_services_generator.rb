class TheCommentsAntispamServicesGenerator < Rails::Generators::NamedBase
  source_root TheCommentsAntispamServices::Engine.root
  # source_root File.expand_path('../templates', __FILE__)
  # argument :xname, type: :string, default: :xname

  # > rails g the_comments_antispam_services OPTION_NAME
  def generate_controllers
    case gen_name
      when 'models'
        # > rails g the_comments_antispam_services models
        cp_models
      when 'jobs'
        # > rails g the_comments_antispam_services jobs
        cp_jobs
      when 'all'
        # > rails g the_comments_antispam_services all
        cp_models
        cp_jobs
      else
        puts 'TheComments Generator - wrong Name'
        puts 'Try to use [ models | jobs | all ]'
    end
  end

  private

  # def root_path; TheCommentsAntispamServices::Engine.root; end

  def gen_name
    name.to_s.downcase
  end

  def cp_models
    directory "app/models/", "app/models"
  end

  def cp_jobs
    directory "app/jobs", "app/jobs"
  end
end
