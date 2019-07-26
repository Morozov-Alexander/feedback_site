require 'sinatra'
require 'rubygems'
require 'sinatra/activerecord'
require 'email_address'
require 'erb'
require 'sinatra/flash'
require 'bcrypt'
require_relative './app/models/users'
require_relative './app/models/restaurants'
require_relative './app/models/comments'
require_relative 'session_controller'
require_relative './app/helpers/user_helper'
class Controller < Sinatra::Base
  include UserHelper
  include BCrypt
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

  post '/login' do
    login(params)
    redirect '/'
  end


  post '/registration' do
    erb :error unless EmailAddress.valid?(params["login"])

    erb :error unless valid_password?(params)
    create_user(params)
  end

  get '/error' do
    "error"
  end



end
# {"username"=>"JetNickson", "email"=>"kirillverenih@ya.ru", "password"=>"1", "confirm_password"=>"1"}
# t.string "name"
# t.string "email"
# t.string "password"