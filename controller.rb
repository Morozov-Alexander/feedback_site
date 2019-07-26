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
class Controller < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  include UserHelper
  configure do
    enable :sessions
    set :session_secret, 'qwe'
  end

  get '/' do
    @restaurants = Restaurant.all
    p session
    erb :home_page
  end

  post '/rate' do
    p session
    p params
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/sign_in' do
    erb :sign_in
  end

  get '/:name' do
    redirect 'sign_in' unless login?
    @rest = Restaurant.all.find_by(name: params[:name])
    erb :page_about_restaurant
  end

  post '/login' do
    login
    redirect '/'
  end

  post '/registration' do
    sign_up
    redirect '/'
  end

  def invalid_password
    flash[:danger] = 'Invalid user password!!!!!!!!'
    redirect 'sign_in'
  end

  def no_email_in_db
    flash[:danger] = 'We can not find you email!!!!!!!!'
    redirect 'sign_in'
  end

  def invalid_email
    flash[:danger] = 'Invalid email!!!!!!!!'
    redirect 'sign_up'
  end

  def password_should_be_the_same
    flash[:danger] = 'Password should be the same as confirm password!!!!!!!!'
    redirect 'sign_up'
  end

  def already_registered
    flash[:danger] = 'This email is already registered!!!!!!!!'
    redirect 'sign_in'
  end
end
