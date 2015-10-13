/*global Backbone*/

var app = app || {}

app.Venues = Backbone.Collection.extend({
  model: app.venue,
})

