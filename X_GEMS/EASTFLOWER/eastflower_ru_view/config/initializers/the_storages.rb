# TheStorages.config.param_name => value
project_name = 'eastflower.ru'

TheStorages.configure do |config|
  config.watermark_text      = project_name
  config.convert_path        = '/usr/bin/convert' # BSD: /usr/local/bin/
  config.watermark_font_path = nil                # "#{ Rails.root.to_s }/vendor/fonts/georgia_italic.ttf"

  config.original_larger_side = 1024
  config.base_larger_side     = 800

  config.file_min_size = 10.bytes
  config.file_max_size = 30.megabytes

  config.default_url     = ":rails_root/public/uploads/#{project_name}/attachments_default/:style-missing.jpg"
  config.attachment_path = ":rails_root/public/uploads/#{project_name}/storages/:storage_type/:storage_id/:style/:filename"
  config.attachment_url  = "/uploads/#{project_name}/storages/:storage_type/:storage_id/:style/:filename"
end

# config.convert_path = '/usr/bin/convert'

# config.watermark_flag      = true
# config.watermark_font_path = nil
# config.watermark_text      = 'https://github.com/the-teacher'
# config.watermarks_path     = "#{ Rails.root.to_s }/public/uploads/watermarks"

# config.file_min_size = 10.bytes
# config.file_max_size = 30.megabytes

# config.default_url     = ":rails_root/public/uploads/attachments_default/:style-missing.jpg"
# config.attachment_path = ":rails_root/public/uploads/storages/:storage_type/:storage_id/:style/:filename"
# config.attachment_url  = "/uploads/storages/:storage_type/:storage_id/:style/:filename"

# config.original_larger_side = 1024
# config.base_larger_side     = 800
