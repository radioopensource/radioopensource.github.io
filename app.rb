require 'sinatra/base'
require './feed_parser'

class App < Sinatra::Base
  include FeedParser

  get '/' do
    @latest_news = most_recent_items

    erb :index
  end

  get '/pr-header.jpg' do
    send_file 'images/pr-header.jpg'
  end

  get '/pr-footer.jpg' do
    send_file 'images/pr-footer.jpg'
  end

  get '/feature.jpg' do
    send_file 'images/feature.jpg'
  end
end
