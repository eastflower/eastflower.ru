module TheCommentsSubscriptions
  module Relations
    extend ActiveSupport::Concern

    included do
      has_many :comment_subscriptions

      has_many :active_subscriptions,
        -> { where(state: :active) },
        class_name: :CommentSubscription
    end
  end
end
