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
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  include UserHelper
  include BCrypt
  configure do
    enable :sessions
    set :session_secret, 'qwe'
  end

  get '/' do
    flash[:danger] = "fwef"
    @restaurants = Restaurant.all
    erb :home_page
  end
  post '/rate' do
    p session
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/deleteMessageFromSession' do
    erb :sign_up
  end

  get '/sign_in' do
    erb :sign_in
  end

  get '/:name' do
  @rest = Restaurant.all.find_by(name:params[:name])
    erb :page_about_restaurant
  end

  post '/login' do
    login(params)
    redirect '/'
  end

  post '/registration' do
    session[:message] = "Удались" unless EmailAddress.valid?(params["login"])

    erb :error unless valid_password?(params)
    create_user(params)
  end
  get '/error' do
    "error"
  end

end