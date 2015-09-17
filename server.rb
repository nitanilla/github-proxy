require 'sinatra/base'
require 'open-uri'
require "typhoeus"

class Server < Sinatra::Base
  get "/*" do
    url = "https://api.github.com/" + params[:splat][0]
    Typhoeus.get(url).body
  end
end
