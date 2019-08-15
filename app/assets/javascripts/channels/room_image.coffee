App.room_image = App.cable.subscriptions.create "RoomImageChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert(data['content']['message'])
    # Called when there's incoming data on the websocket for this channel
