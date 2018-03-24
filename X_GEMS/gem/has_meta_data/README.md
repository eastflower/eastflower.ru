# HasMetaData

# MetaData

rake has_meta_data_engine:install:migrations

rake db:migrate

class Post < AR
  include ::HasMetaData::Holder
end