/*global Backbone*/

var app = app || {}

app.AppRouter = Backbone.Router.extend({
  routes: {
    '': 'viewNowPlaying',
    'leaderboard': 'viewLeaderboard',
  },

  viewNowPlaying: function () {
    var nowPlayingView = new app.NowPlayingView({model: app.venue})
    nowPlayingView.render()
  },

  viewLeaderboard: function () {
    var leaderboardView = new app.LeaderboardView({model: app.venue})
    leaderboardView.render()
  },
})

