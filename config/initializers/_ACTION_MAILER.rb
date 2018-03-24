app = Rails.application

# localhost:300//rails/mailers
if Rails.env.development?
  app.config.action_mailer.preview_path = "#{ Rails.root }/app/mailers"
end

# ======================================================
# Mailer settings
# ======================================================
app_mailer   = ::Settings.app.mailer
smtp_default = app_mailer.smtp.default

app.config.action_mailer.default_url_options = { host: app_mailer.host }

if app_mailer.service == 'smtp'
  app.config.action_mailer.delivery_method = :smtp
  app.config.action_mailer.raise_delivery_errors = true

  app.config.action_mailer.smtp_settings = {
    address:   smtp_default.address,
    domain:    smtp_default.domain,
    port:      smtp_default.port,

    user_name: smtp_default.user_name,
    password:  smtp_default.password,

    authentication: smtp_default.authentication,
    enable_starttls_auto: true
  }

elsif app_mailer.service == 'letter_opener'
  app.config.action_mailer.delivery_method = :letter_opener

elsif app_mailer.service == 'mailcatcher'
  app.config.action_mailer.delivery_method = :smtp
  app.config.action_mailer.smtp_settings = { address: "localhost", port: 1025 }

elsif app_mailer.service == 'sandmail'
  app.config.action_mailer.raise_delivery_errors = true

  app.config.action_mailer.sendmail_settings = {
    location:  app_mailer.sandmail.location,
    arguments: app_mailer.sandmail.arguments
  }
else
  app.config.action_mailer.delivery_method = :test
  app.config.action_mailer.raise_delivery_errors = false
end
