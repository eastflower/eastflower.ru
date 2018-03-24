# ***************************************
# set database config location
# ***************************************
#
if ::AppViewEngine::Engine
  app = ::HakushuIo::Application
  app.config.paths['config/database'].unshift(
    "#{ app.config.root }/config/_CONFIGS/#{ ::Rails.env }/database.yml"
  )
end
# ***************************************
