require 'sinatra/base'
require "sinatra/reloader"
require './lib/postcode_checker'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/postcode_checker.rb'
  end

  get '/' do
    return erb(:index)
  end

  get '/check' do
    valid = PostcodeChecker.new.valid?(params[:postcode])
    return erb(:check)
  end
end
