/*global Backbone*/

var app = app || {}

app.TopArtist = Backbone.Model.extend({
  defaults: {
    sArtist: '',
    sArtistImage: '',
  },
})

