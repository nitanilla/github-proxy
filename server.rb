require 'sinatra/base'
require 'open-uri'
require "typhoeus"

class Server < Sinatra::Base
  get "/*" do
    url = "https://api.github.com/" + params[:splat][0]
    uri = URI.parse(url)
    new_params = params.to_hash
    new_params.delete('splat')
    new_params.delete('captures')
    uri.query = URI.escape(new_params.map{|key,val| "#{key}=#{val}"}.join("&")) unless new_params.empty?
    p uri.to_s
    Typhoeus.get(uri.to_s).body
  end
end
