class MessagesController < ApplicationController
  def new
    @messages = Message.new
  end
end
