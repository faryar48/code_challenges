/*global Backbone, _, $*/

var app = app || {}

app.LeaderboardView = Backbone.View.extend({
  el: '#main',
  initialize: function () {
    _.bindAll(this, 'render')
    this.listenTo(app.venue, 'change', this.render)
  },

  render: function () {
    var leaderBoardTemplate = _.template($('#leaderboardView-template').html())
    this.$el.html(leaderBoardTemplate(app.venue.toJSON()))
    $('a')[0].style.color = 'gray'
    $('a')[1].style.color = '#3F86E6'
  },
})

