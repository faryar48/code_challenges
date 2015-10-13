/*global Backbone, $*/

var app = app || {}

$(document).ready(function () {
  app.venue = new app.Venue({currentVenueID: 10})
  app.venue.fetch()
  setInterval(function () {
    app.venue.fetch()
  }, 30000)
  app.appRouter = new app.AppRouter()
  Backbone.history.start()
})

