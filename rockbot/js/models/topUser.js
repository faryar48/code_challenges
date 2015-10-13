/*global Backbone*/

var app = app || {}

app.TopUser = Backbone.Model.extend({
  defaults: {
    sUser: '',
    sUserImage: '',
  },
})

