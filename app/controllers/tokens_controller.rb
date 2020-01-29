class TokensController < ApplicationController
  # Requires the user to be logged in before creating token
  before_action :require_login

  def create
    # Define User Identity
    identity = current_user.email

    # Create Grant for Access Token
    grant = Twilio::JWT::AccessToken::ChatGrant.new
    grant.service_sid = ENV['TWILIO_CHAT_SERVICE_SID']

    # Create an Access Token
    token = Twilio::JWT::AccessToken.new(
        ENV['TWILIO_ACCOUNT_SID'],
        ENV['TWILIO_API_KEY'],
        ENV['TWILIO_API_SECRET'],
        [grant],
        identity: identity
    )

    # Generate the token and send to client
    render json: { identity: identity, token: token.to_jwt }
  end
end
