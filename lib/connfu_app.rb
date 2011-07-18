require 'sinatra'
require 'json'

class ConnfuApp < Sinatra::Base
  get "/" do
    "Connfu Heroku Addon app"
  end

  post "/heroku/resources" do
    # Create the connfu user and relevant details
    result = { :id => "1", :config => { "CONNFU_URL" => "usera@127.0.0.1", "CONNFU_PASSWD" => "1" } }
    result.to_json
  end
end