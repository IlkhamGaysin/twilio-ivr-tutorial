class PagesController < ApplicationController
  expose :twilio_client, model: Twilio::REST::Client
  expose :account, from: :twilio_client
  expose :calls, -> { account.calls.list }

  def home
  end
end
