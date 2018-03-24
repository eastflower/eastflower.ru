module AppViewEngine
  module MailerAttachments
    extend ActiveSupport::Concern

    included do
      before_action :set_mailer_attachments!
    end # included

    private

    def set_mailer_attachments!
      _root_ = ::AppViewEngine::Engine.root

      # image_tag attachments['letter-header.jpg'].url

      @images = {
        'letter-header.jpg' => '/eastflower.ru/mailer/letter-header.jpg'
      }

      @images.each_pair do |name, path|
        attachments[name] = File.read("#{ _root_ }/public/#{ path }")
      end
    end
  end
end