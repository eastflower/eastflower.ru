if defined? ThinkingSphinx
  class ThinkingSphinx::Configuration
    private

    def settings_file
      framework_root.join 'config', '_CONFIGS', 'production', 'services', 'thinking_sphinx.yml'
    end
  end
end

if defined? ThinkingSphinx
  class ThinkingSphinx::Search
    def pagination params
      page(params[:page]).per(params[:per_page])
    end
  end
end
