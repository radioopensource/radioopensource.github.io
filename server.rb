require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    send_file 'public/index.html'
  end

  get '/pr-header.jpg' do
    send_file 'public/images/pr-header.jpg'
  end

  get '/pr-footer.jpg' do
    send_file 'public/images/pr-footer.jpg'
  end

  get '/feature.jpg' do
    send_file 'public/images/feature.jpg'
  end
end
