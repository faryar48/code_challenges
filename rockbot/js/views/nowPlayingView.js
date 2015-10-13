/*global Backbone, _, $*/

var app = app || {}

app.NowPlayingView = Backbone.View.extend({
  el: '#main',
  initialize: function () {
    _.bindAll(this, 'render')
    this.listenTo(app.venue, 'change', this.render)
  },

  render: function () {
    var nowPlayingTemplate = _.template($('#nowPlayingView-template').html())
    this.$el.html(nowPlayingTemplate(app.venue.toJSON()))
    $('a')[0].style.color = '#3F86E6'
    $('a')[1].style.color = 'gray'
  },
})

