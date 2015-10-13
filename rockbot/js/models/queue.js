/*global Backbone*/

var app = app || {}

app.Queue = Backbone.Model.extend({
  defaults: {
    sArtist: '',
    sSong: '',
    sArtwork: '',
    sUser: '',
    sUserImage: '',
    iLikes: '',
    iDislikes: '',
  },
})

