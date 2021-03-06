@PubCategoryRels = do ->
  init: ->
    @inited ||= do ->
      doc = $ document

      doc.on 'change', '.js--pub-category-rels--checkbox', (e) ->
        checkbox =  $ e.target

        cat_id   = checkbox.data('category-id')
        cat_type = checkbox.data('category-type')

        val = checkbox.prop('checked')
        val = if val then 1 else 0

        form = $('.js--pub-category-rels--form')

        form.find('[name=category_id]').val cat_id
        form.find('[name=category_type]').val cat_type

        form.find('[name=checked]').val val
        form.find('[name=render_type]').val 'pub_category'

        form.submit()
