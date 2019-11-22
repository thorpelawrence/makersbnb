# frozen_string_literal: true

require "sinatra"
require_relative "lib/user"
require_relative "lib/property"
require_relative "lib/booking"

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

    return "Passwords do not match" unless params[:password] == params[:'confirm-password']

    User.create(params[:username], params[:password], params[:email], params[:phone])
    session[:username] = params[:username]
    redirect "/"
  end

  get "/profile" do
    @username = session[:username]
    if @username.nil?
      return redirect "/login"
    end
    @properties = Property.all_for_username(@username)
    @user_bookings = Booking.get_booking_by_guest_username(@username)
    @bookings = Booking.all_for_username(@username)
    erb(:profile)
  end

  get "/add-space" do
    @username = session[:username]
    if @username.nil?
      return redirect "/login"
    end
    erb(:'add-space')
  end

  get "/bookings-page" do
    @username = session[:username]
    property_id = params[:property]
    @property = Property.get_by_id(property_id)
    redirect "/" if @property.nil?
    if @username.nil?
      return redirect "/login"
    end
    erb(:'bookings-page')
  end

  post "/add-space" do
    @username = session[:username]
    if @username.nil?
      return redirect "/login"
    end
    Property.create(params[:"home-type"], params[:location], params[:"room-type"], params[:accomodates], params[:price],
                    params[:"date-from"], params[:"date-to"], params[:"property-name"], params[:beds], params[:wifi], params[:parking],
                    params[:kitchen], params[:heating], params[:"property-img"], session[:username])
    redirect "/profile"
  end

  post "/book-space" do
    Booking.create(params[:'property-id'], session[:username], params[:'trip-start'], params[:'trip-end'])
    redirect "/profile"
  end

  get "/approve" do
    Booking.approve_booking(params[:guest], params[:property], params[:approve] == "true")
    redirect "/profile"
  end
end
