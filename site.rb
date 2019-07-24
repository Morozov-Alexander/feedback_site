require 'sinatra'
require 'sinatra/activerecord'
 require_relative './app/models/models'
get '/registration' do
  erb :registration
 end
User.find_each do |user|
  p user.name
end