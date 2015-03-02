angular.module('dotInfo', ['ngResource', 'ngResource'])
  .factory('FeedLoader', function($resource) {
    return $resource('http://ajax.googleapis.com/ajax/services/feed/load', {}, {
      fetch: { method: 'JSONP', params: {v: '1.0', callback: 'JSON_CALLBACK'} }
    });
  })
  .service('FeedList', function(FeedLoader) {
    this.get = function () {
      var feedSources = [
        { title: "NPR", url: "http://www.npr.org/rss/podcast.php?id=500005" },
        { title: "BBC", url: "http://downloads.bbc.co.uk/podcasts/worldservice/globalnews/rss.xml" },
        { title: "PRI", url: "http://feeds.feedburner.com/pri/theworld?format=xml" }
      ];

      var feeds = {};

      angular.forEach(feedSources, function (item) {
        FeedLoader.fetch({q: item.url, num: 1}, {}, function (data) {
          var feed = data.responseData.feed;
          feeds[item.title] = feed.entries[0].mediaGroups[0].contents[0].url;
        });
      });

      return feeds;
    };
  })
  .controller('NewsController', function($scope, FeedList) {
    $scope.feeds = FeedList.get();
  });
