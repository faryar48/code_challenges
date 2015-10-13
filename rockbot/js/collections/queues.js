/*global Backbone*/

var app = app || {}

app.Queues = Backbone.Collection.extend({
  model: app.queue,
})

