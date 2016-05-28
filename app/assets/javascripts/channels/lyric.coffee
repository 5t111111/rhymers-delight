App.lyric = App.cable.subscriptions.create "LyricChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#rhyme').html(data['rhyme'])

  make_it_rhyme: (source) ->
    @perform 'make_it_rhyme', source: source
