class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate, :except => [:callback, :logout]

  def authenticate
    if session[:access_token].blank?
      #redirect_to signin_url
      params = {
        redirect_uri: redirect_uri,
        response_type: 'code',
        scope: 'activity',
        client_id: ENV['MOVES_CLIENT_ID']
      }
      moves_url = "https://api.moves-app.com/oauth/v1/authorize?#{params.to_query}"
      redirect_to moves_url
    end
  end

protected
  # def client
  #   OAuth2::Client.new(
  #     ENV['MOVES_CLIENT_ID'],
  #     ENV['MOVES_CLIENT_SECRET'],
  #     :site => 'https://api.moves-app.com',
  #     :authorize_url => 'moves://app/authorize',
  #     :token_url => 'https://api.moves-app.com/oauth/v1/access_token')
  # end

  def redirect_uri
    uri = URI.parse(request.url)
    uri.path = '/auth/moves/callback'
    uri.query = nil
    uri.to_s
  end

  def access_token
    OAuth2::AccessToken.new(client, session[:access_token], :refresh_token => session[:refresh_token])
  end

end
