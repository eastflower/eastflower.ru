if Rails.env.development?
  Premailer::Rails.config.merge!(
    preserve_styles: true,
    remove_classes: false,
    remove_ids: false
  )
else
  Premailer::Rails.config.merge!(
    preserve_styles: true,
    remove_classes: true,
    remove_ids: true
  )
end