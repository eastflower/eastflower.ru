@TheCommentsManager = do ->
  init: ->
    hide_comment_panel = (btn) ->
      $(btn).parents('.js--comments--panel').slideUp()

    comments = $ '.js--comments'

    # CONTROLS
    comments.on 'click', '.js--comments--comment-info-btn', ->
      btn    = $ @
      holder = btn.parents('.js--comments--panel')
      holder.find('.js--comments--comment-info').slideToggle()
      false

    comments.on 'click', '.js--comments--comment-edit', ->
      btn    = $ @
      holder = btn.parents('.js--comments--panel')
      holder.find('.js--comments--edit-form, .js--comments--comment-body, .js--comments--comment-edit').toggle()
      false

    comments.on 'ajax:success', '.js--comments--to-published, .js--comments--to-draft, .js--comments--to-spam, .js--comments--to-deleted', (request, response, status) ->
      JODY.processor(response)
      hide_comment_panel @

    # Edit form
    comments.on 'ajax:success', '.js--comments--edit-form', (request, response, status) ->
      form   = $ @
      holder = form.parents('.js--comments--panel')
      holder.find('.js--comments--edit-form, .js--comments--comment-body, .js--comments--comment-edit').toggle()
      holder.find('.js--comments--comment-body').replaceWith response
