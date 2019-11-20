# frozen_string_literal: true

require "sinatra"
require_relative "lib/user"
require_relative "lib/property"

class MakersBNB < Sinatra::Base
  enable :sessions
  set :session_secret, "SESSION_SECRET_CHANGE_FOR_PRODUCTION"

  get "/" do
    @username = session[:username]
    @properties = Property.all
    erb(:index)
  end

  get "/login" do
    erb(:login)
  end

  get "/logout" do
    session[:username] = nil
    redirect "/"
  end

  post "/login" do
    username = params[:username]
    password = params[:password]
    return "Username or password incorrect" unless User.check_password(username, password)
    session[:username] = username
    redirect "/"
  end

  get "/signup" do
    erb(:'sign-up')
  end

  post "/sign-up" do
    username = params[:username]
    user = User.get_by_username(username)

    return "Username is already taken. Email is already taken." unless user.nil?

    User.create(params[:username], params[:password], params[:email], params[:phone])
    session[:username] = params[:username]
    redirect "/"
  end

  get "/add-space" do
    erb(:'add-space')
  end

  get "/bookings-page" do
    erb(:'bookings-page')
  end
end
