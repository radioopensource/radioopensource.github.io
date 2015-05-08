require 'sinatra/base'
require './feed_parser'

class App < Sinatra::Base
  include FeedParser

  get '/' do
    recents = most_recent_items

    @npr = recents["NPR"]
    @pri = recents["PRI"]
    @bbc = recents["BBC"]

    erb :index
  end

  get '/favicon' do
    send_file "public/favicon.ico"
  end
end
