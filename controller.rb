# frozen_string_literal: true
require 'sinatra'
require 'rubygems'
require 'sinatra/activerecord'
require 'erb'
require 'sinatra/flash'
require_relative './app/models/users'
require_relative './app/models/restaurants'
require_relative './app/models/comments'
require_relative 'session_controller'
require_relative './app/helpers/user_helper'
require_relative './app/helpers/comment_helper'
require_relative './app/helpers/messages_helper'
require_relative './app/helpers/restaurant_helper'
class Controller < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  include UserHelper
  include CommentHelper
  include MessagesHelper
  include RestaurantHelper

  configure do
    enable :sessions
    set :session_secret, 'qwe'
  end

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

  get '/:name' do
    session[:cafe_name] = params[:name]
    info_about_selected_cafe
    erb :page_about_restaurant
  end

  post '/login' do
    login
    redirect '/'
  end

  post '/rate' do
    create_comment
    redirect "/#{session[:cafe_name]}"
  end

  post '/registration' do
    sign_up
    redirect '/'
  end

end
