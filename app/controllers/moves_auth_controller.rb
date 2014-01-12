class MovesAuthController < ApplicationController

  def logout
    session[:access_token]  = nil
    redirect_to root_url
  end

  def callback
    # Exchange auth token for access token
    data = {
      grant_type: 'authorization_code',
      code: params[:code],
      client_id: ENV['MOVES_CLIENT_ID'],
      client_secret: ENV['MOVES_CLIENT_SECRET'],
      redirect_uri: redirect_uri
    }

    puts data
    begin
      response = RestClient.post('https://api.moves-app.com/oauth/v1/access_token', data)
      result = JSON.parse(response)


      session[:access_token] = result["access_token"]
      session[:user_id] = result["user_id"]
      redirect_to root_url

    rescue Exception => e
      puts e
      redirect_to root_url
    end



    # For mobile auth...
    # new_token = client.auth_code.get_token(params[:code], :redirect_uri => redirect_uri)
    # session[:access_token]  = new_token.token
    # redirect root_url
  end
end