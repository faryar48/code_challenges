/*global Backbone*/

var app = app || {}

app.NowPlaying = Backbone.Model.extend({
  defaults: {
    sArtist: '',
    sSong: '',
    sArtwork: '',
    sUser: '',
    sUserImage: '',
    iLikes: '',
    iDislikes: '',
    iDuration: '',
    iSecondsRemaining: '',
  },
})
