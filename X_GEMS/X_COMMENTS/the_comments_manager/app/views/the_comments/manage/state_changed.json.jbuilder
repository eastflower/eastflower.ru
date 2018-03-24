cuser = current_user

json.set! :html_content, {
  set_html: {
    ".js--comments--all-published-count" => Comment.with_state(:published).count,
    ".js--comments--all-draft-count"     => Comment.with_state(:draft).count,
    ".js--comments--all-deleted-count"   => Comment.with_state(:deleted).count,
    ".js--comments--all-spam-count"      => Comment.where(spam: true).count,

    ".js--comments--my-published-count" => cuser.my_published_comments.count,
    ".js--comments--my-draft-count"     => cuser.my_draft_comments.count,
    ".js--comments--my-deleted-count"   => cuser.my_deleted_comments.count,
    ".js--comments--my-spam-count"      => cuser.my_spam_comments.count,

    ".js--comments--comcoms-published-count" => cuser.published_comcoms_count,
    ".js--comments--comcoms-draft-count"     => cuser.draft_comcoms_count,
    ".js--comments--comcoms-deleted-count"   => cuser.deleted_comcoms_count,
    ".js--comments--comcoms-spam-count"      => cuser.spam_comcoms_count
  }
}