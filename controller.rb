require 'sinatra'
require 'rubygems'
require 'sinatra/activerecord'
require 'email_address'
require 'erb'
require 'sinatra/flash'
require_relative './app/models/users'
require_relative './app/models/restaurants'
require_relative './app/models/comments'
class Controller < Sinatra::Base
  enable :sessions
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  get '/' do
    @restaurants = Restaurant.all
    erb :home_page
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/check' do
    p params
    redirect '/sign_up'
  end

  post '/login' do

  end
  post '/registration' do
    p params
    erb :error unless EmailAddress.valid?(params["login"])
  end

  get '/error' do
    "error"
  end

end