require 'sinatra'
require 'json'

class ConnfuApp < Sinatra::Base
  get "/" do
    "Connfu Heroku Addon app"
  end

  helpers do
    def protected!
      unless authorized?
        response['WWW-Authenticate'] = %(Basic realm="Connfu Heroku Addon HTTP Auth")
        throw(:halt, [401, "Not authorized\n"])
      end
    end

    def authorized?
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ['connfu', 'zPtRdLgyWBsnDWaL']
    end
  end

  post "/heroku/resources" do
    protected!
    # TODO: Create the connfu user and relevant details
    result = { :id => "1", :config => { "CONNFU_URL" => "usera@127.0.0.1", "CONNFU_PASSWD" => "1" } }
    result.to_json
  end
end