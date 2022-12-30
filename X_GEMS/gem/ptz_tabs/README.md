# PtzTabs

1.

gem 'ptz_tabs', path: './X_GEMS/VIEW/ptz_tabs'

2.

JS

//= require components/ptz-tabs

CSS

/*
  #= require components/ptz-tabs
*/

JS INIT

$(document).on "ready page:load", ->
  PtzTabs.init()

HTML/SLIM

##################################
# Variant 1
##################################

div(ptz--tabs-scope='page_edit')
  .ptz--tabs--item.active(ptz--tab-id='comments') Comments (90)
  .ptz--tabs--item(ptz--tab-id='files') Files (2)
  .ptz--tabs--item(ptz--tab-id='specs') Specs (1)

div(ptz--tabs-scope='page_edit')
  .ptz--tabs--content-item.active(ptz--tab-content='comments')
  .ptz--tabs--content-item(ptz--tab-content='files')
  .ptz--tabs--content-item(ptz--tab-content='specs')

##################################
# Variant 2
##################################

.ptz--tabs(ptz--tabs-scope='page_edit_2')
  .ptz--tabs--holder
    .ptz--tabs--item.ptz--tabs--active(ptz--tab-id='comments') Comments (90)
    .ptz--tabs--item(ptz--tab-id='files') Files (2)
    .ptz--tabs--item(ptz--tab-id='specs') Specs (1)
  .m20
    .ptz--tabs--content-item.ptz--tabs--active(ptz--tab-content='comments')
      | 1
    .ptz--tabs--content-item(ptz--tab-content='files')
      | 2
    .ptz--tabs--content-item(ptz--tab-content='specs')
      | 3