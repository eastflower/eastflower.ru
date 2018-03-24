# class CommentSubscriptionsController < ApplicationController
#   include ::TheCommentsSubscriptions::Controller
# end

module TheCommentsSubscriptions
  module Controller
    extend ActiveSupport::Concern

    included do
      before_action :define_subscriptions_params, only: %w[ unsubscribe_comment unsubscribe_commentable unsubscribe_all ]
    end

    def manage
      @email = EncryptorHelper.decrypt params[:email]

      render template: 'the_comments/subscriptions/manage'
    end

    def unsubscribe_comment
      email_unsubscribe_comment if @type == 'email'
      user_unsubscribe_comment  if @type == 'user'

      render template: 'the_comments/subscriptions/info'
    end

    def unsubscribe_commentable
      email_unsubscribe_commentable if @type == 'email'
      user_unsubscribe_commentable  if @type == 'user'

      render template: 'the_comments/subscriptions/info'
    end

    def unsubscribe_all
      email_unsubscribe_all if @type == 'email'
      user_unsubscribe_all  if @type == 'user'

      render template: 'the_comments/subscriptions/info'
    end

    private

    # =====================================
    # COMMENT
    # =====================================
    def email_unsubscribe_comment
      subs = @comment.active_subscriptions.where(email: @email)
      @subs_count = subs.count

      subs.update_all(state: :unactive)
      define_info_params_for_email
    end

    def user_unsubscribe_comment
      subs = @comment.active_subscriptions.where(user_id: @user_id)
      @subs_count = subs.count

      subs.update_all(state: :unactive)
      define_info_params_for_user
    end

    # =====================================
    # COMMENTABLE
    # =====================================
    def email_unsubscribe_commentable
      subs = ::CommentSubscription.where(comment_id: @comments_id, email: @email, state: :active)
      @subs_count = subs.count

      subs.update_all(state: :unactive)
      define_info_params_for_email
    end

    def user_unsubscribe_commentable
      subs = ::CommentSubscription.where(comment_id: @comments_id, user_id: @user_id, state: :active)
      @subs_count = subs.count

      subs.update_all(state: :unactive)
      define_info_params_for_user
    end

    # =====================================
    # ALL
    # =====================================
    def email_unsubscribe_all
      subs = ::CommentSubscription.where(email: @email, state: :active)
      @subs_count = subs.count

      subs.update_all(state: :unactive)
      define_info_params_for_email
    end

    def user_unsubscribe_all
      subs = ::CommentSubscription.where(user_id: @user_id, state: :active)
      @subs_count = subs.count

      subs.update_all(state: :unactive)
      define_info_params_for_user
    end

    # =====================================
    # COMMON
    # =====================================
    def define_subscriptions_params
      @type    = EncryptorHelper.decrypt(params[:type]).downcase
      @user_id = @email = EncryptorHelper.decrypt(params[:id])

      if params[:comment_id]
        @comment_id  = EncryptorHelper.decrypt(params[:comment_id])
        @comment     = ::Comment.find @comment_id
        @comments_id = @comment.commentable.comments.pluck(:id)
      end
    end

    def define_info_params_for_email
      @total_active_subscriptions       = ::CommentSubscription.where(email: @email, state: :active).count
      @commentable_active_subscriptions = ::CommentSubscription.where(comment_id: @comments_id, email: @email, state: :active).count
    end

    def define_info_params_for_user
      @user = ::User.find @user_id
      @total_active_subscriptions       = ::CommentSubscription.where(user_id: @user_id, state: :active).count
      @commentable_active_subscriptions = ::CommentSubscription.where(comment_id: @comments_id, user_id: @user_id, state: :active).count
    end
  end
end
