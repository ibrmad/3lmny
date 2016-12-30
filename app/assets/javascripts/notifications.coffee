class Notifications
  constructor: ->
    @notifications = $("#show_notifications")
    @setup() if @notifications.length > 0

  setup: ->
    $('#show_notifications').on 'click', @handleClick
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )
  handleSuccess: (data) ->
    items = $.map data, (notification) ->
      "<a class='notification' href='#{notification.url}'>
      #{notification.actor} #{notification.action}
      </a>"
    if items.length > 0
      $("#unread_count").text(items.length).css('display', 'block')
      $("#notifications_toggle").html(items)
    else
      $("#notifications_toggle").html("<p>There is no notifications!</p>")
  handleClick: (e) ->
    $.ajax(
      url: "/notifications/mark_as_read"
      dataType: "JSON"
      method: "POST"
      success: ->
        $("#unread_count").text(0).css('display', 'none')
    )

$( document ).on 'turbolinks:load', ->
  new Notifications
