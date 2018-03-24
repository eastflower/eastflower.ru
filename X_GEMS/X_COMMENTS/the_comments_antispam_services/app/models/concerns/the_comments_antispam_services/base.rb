module TheCommentsAntispamServices
  module Base
    extend ActiveSupport::Concern

    included do
      include ::TheCommentsAntispamServices::Akismet
      include ::TheCommentsAntispamServices::YandexCleanweb
    end

    def antispam_services_check request
      logger.debug { "*" * 50 }
      logger.debug { "TheComments::Antispam::Check" }
      logger.debug { "*" * 50 }

      comment = self

      request_data = {
        user_ip:    request.try(:ip),
        referrer:   request.try(:referrer),
        user_agent: request.try(:user_agent)
      }.compact

      if ::TheCommentsBase.config.async_processing
        ::TheCommentsAntispamJob.perform_later(comment.id, request_data)
      else
        antispam_services_check_batch(request_data)
      end
    end

    def antispam_services_check_batch request_data
      cleanweb_antispam_check(request_data)
      akismet_antispam_check(request_data)
      action_after_spam_checking
    end

    private

    # Overload this method into your App
    # Do something if spam services return `true`
    def action_after_spam_checking
      comment = self

      spam_flag_1 = comment.akismet_state.to_s == 'spam'
      spam_flag_2 = comment.yandex_cleanweb_state.to_s == 'spam'

      # for example mark it as SPAM
      # and move to DELETED comments
      # || or &&
      if spam_flag_1 && spam_flag_2
        comment.mark_as_spam
        comment.to_deleted
      end
    end
  end
end
