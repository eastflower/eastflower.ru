app = Rails.application

app.config.middleware.use ExceptionNotification::Rack,
  ignore_exceptions: ExceptionNotifier.ignored_exceptions,
  email: {
    email_prefix:         "[EASTFLOWER.RU/ERRORS:] ",
    sender_address:       %[ #{ ::Settings.app.mailer.admin_email } ],
    exception_recipients: [ ::Settings.app.mailer.admin_email ]
  }

# if Rails.env.production?
  # mailer_parent: 'ActionMailer::Base',
  # template_path: 'exception_notifier'
# end
