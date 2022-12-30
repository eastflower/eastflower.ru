class TheCommentsAntispamJob < ActiveJob::Base
  queue_as :the_comments_jobs

  # TheCommentsAntispamJob.perform_later(comment_id, { ... })
  # TheCommentsAntispamJob.perform_now(comment_id, { ... })
  def perform(comment_id, request_data)
    comment = Comment.find(comment_id)
    comment.antispam_services_check_batch(request_data)
  end
end
