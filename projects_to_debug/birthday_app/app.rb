require 'sinatra/base'
require "sinatra/reloader"
require './lib/birthday_greeter'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/birthday_greeter.rb'
  end

  get '/' do
    return erb(:index)
  end

  post '/greet' do
    message = BirthdayGreeter.new.greet_birthday(params[:birthday])

    return erb(:greet)
  end
end
