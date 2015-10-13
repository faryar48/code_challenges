/*global Backbone*/

var app = app || {}

app.TopArtists = Backbone.Collection.extend({
  model: app.topArtist,
})

