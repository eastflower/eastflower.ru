module TheCommentsSubscriptions
  module User
    extend ActiveSupport::Concern

    included do
      belongs_to :user
      belongs_to :comment

      validates :user_id, uniqueness: { scope: :comment_id }, if: ->(c) { c.email.blank? }
      validates :email,   uniqueness: { scope: :comment_id }, if: ->(c) { c.user.blank?  }
    end
  end
end
