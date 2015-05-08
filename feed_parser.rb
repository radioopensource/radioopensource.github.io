require 'nokogiri'
require 'feedjira'

module FeedParser
  URLS = {
    "NPR" => "http://www.npr.org/rss/podcast.php?id=500005",
    "BBC" => "http://downloads.bbc.co.uk/podcasts/worldservice/newshour/rss.xml",
    "PRI" => "http://feeds.feedburner.com/pri/theworld?format=xml"
  }

  def most_recent_items
    result = {}

    URLS.each do |k, v|
      result[k] = grab_most_recent_from(k, v)
    end

    result
  end

  def grab_most_recent_from(source, url)
    if source == "PRI"
      xml = Feedjira::Feed.fetch_raw(url)
      Nokogiri::XML(xml).at_css("item enclosure").attributes["url"].value
    else
      Feedjira::Feed.fetch_and_parse(url).entries.first.enclosure_url
    end
  end
end
