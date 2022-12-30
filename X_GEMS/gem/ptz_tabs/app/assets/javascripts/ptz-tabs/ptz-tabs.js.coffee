###################################
# Variant 1
###################################
#
# div(ptz--tabs-scope='page_edit')
#   .ptz--tabs--item.active(ptz--tab-id='comments') Comments (90)
#   .ptz--tabs--item(ptz--tab-id='files') Files (2)
#   .ptz--tabs--item(ptz--tab-id='specs') Specs (1)
#
# div(ptz--tabs-scope='page_edit')
#   .ptz--tabs--content-item.active(ptz--tab-content='comments')
#   .ptz--tabs--content-item(ptz--tab-content='files')
#   .ptz--tabs--content-item(ptz--tab-content='specs')

###################################
# Variant 2
###################################
#
# .ptz--tabs(ptz--tabs-scope='page_edit_2')
#   .ptz--tabs--holder
#     .ptz--tabs--item.ptz--tabs--active(ptz--tab-id='comments') Comments (90)
#     .ptz--tabs--item(ptz--tab-id='files') Files (2)
#     .ptz--tabs--item(ptz--tab-id='specs') Specs (1)
#   .m20
#     .ptz--tabs--content-item.ptz--tabs--active(ptz--tab-content='comments')
#       | 1
#     .ptz--tabs--content-item(ptz--tab-content='files')
#       | 2
#     .ptz--tabs--content-item(ptz--tab-content='specs')
#       | 3

@PtzTabs = do ->
  # Init once for Turbolinks
  init: ->
    @inited ||= do =>
      doc  = $ document
      tabs = '[ptz--tab-id]'

      doc.on 'click', tabs, (e) ->
        tab = $ e.target
        return false if tab.hasClass 'ptz--tabs--active'

        tabs_scope = tab.parents('[ptz--tabs-scope]').first().attr('ptz--tabs-scope')
        return false unless tabs_scope

        tab_id = tab.attr('ptz--tab-id')
        window.location.hash = "ptz--tabs--#{ tabs_scope }--#{ tab_id }"

        tabs          = $("[ptz--tabs-scope=#{ tabs_scope }] [ptz--tab-id]")
        atabs         = $("[ptz--tabs-scope=#{ tabs_scope }] [ptz--tab-id=#{ tab_id }]")
        content_items = $("[ptz--tabs-scope=#{ tabs_scope }] [ptz--tab-content]")

        content_item  = content_items.filter("[ptz--tab-content=#{ tab_id }]")
        return false if content_item.length is 0

        tabs.removeClass('ptz--tabs--active')
        atabs.addClass('ptz--tabs--active')

        content_items.removeClass('ptz--tabs--active')
        content_item.addClass('ptz--tabs--active')

        content_items.hide()
        content_item.show()

    # ACTIVATE TAB if need
    if window.location.hash.length > 0
      anchor = window.location.hash
      anchor = anchor.slice(1, anchor.lenght)
      anchor = anchor.split('ptz--tabs--')

      if anchor.length > 1
        [scope, id]= anchor[1].split('--')
        $("[ptz--tabs-scope=#{ scope }] [ptz--tab-id=#{ id }]").click()