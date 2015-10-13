/*global Backbone*/

var app = app || {}

app.TopUsers = Backbone.Collection.extend({
  model: app.topUser,
})

