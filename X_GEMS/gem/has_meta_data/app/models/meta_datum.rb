class MetaDatum < ActiveRecord::Base
  include SimpleSort::Base
  include Pagination::Base
  belongs_to :holder, polymorphic: true

  validates :holder_id, presence: true
  validates :holder_id, uniqueness: { scope: :holder_type, message: "Holder existed" }
end