require 'json'
require 'jwt'
require 'sinatra/base'


class Api < Sinatra::Base
  def initialize
    super

  @accounts ={
    tomodelonge: 10000,
    markhoppus: 50000,
    travisbarker: 1000000000
  }
  end


  get '/money' do
    content_type :json
    { message: "Hello World!"}.to_json
  end
end


class Public < Sinatra::Base
  def initialize
    super
  @logins = {
    tomodelonge: 'allthesmallthings',
    markhoppus: 'therockshow',
    travisbarker: 'whatsmyageagain'
  }
  end
  post '/login' do
    username = params[:username]
    password = params[:password]

    if @logins[username.to_sym] == password
      content_type :json
      { message: "you logged in. Yay you!" }.to_json
    else
      halt 401
    end
  end
end
