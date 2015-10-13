/*global Backbone*/

var app = app || {}

app.Venue = Backbone.Model.extend({
  initialize: function (options) {
    console.log('options', options)
    this.currentVenueID = options.currentVenueID
  },
  url: function () {
    return 'https://api.rockbot.com/v2/venue/' + this.currentVenueID
  },
  defaults: {
    aNowPlaying: app.nowPlaying,
    aQueue: app.queue,
    aTopUsers: app.topUser,
    aTopArtists: app.topArtist,
  },
})

