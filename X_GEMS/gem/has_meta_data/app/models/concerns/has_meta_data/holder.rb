# include ::HasMetaData::Holder
module HasMetaData
  module Holder
    extend ActiveSupport::Concern

    included do
      has_one :meta_datum, as: :holder

      def meta_data
        meta_datum || (create_meta_datum! ; meta_datum)
      end
    end
  end
end