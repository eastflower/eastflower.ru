$(document).on 'ready page:load', ->
  notificator = Notifications
  TheComments.init(notificator)
  TheCommentsHighlight.init()
  BlogSearchForm.init()

  TheComments.i18n =
    server_error: "Ошибка сервера: {code}"
    please_wait: "Пожалуйста подождите {sec} сек."
    succesful_created: "Комментарий успешно создан"