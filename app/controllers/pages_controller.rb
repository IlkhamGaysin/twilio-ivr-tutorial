class PagesController < ApplicationController
  expose :twilio_client, model: Twilio::REST::Client
  expose :account, from: :twilio_client
  expose_decorated :calls, -> { account.calls.list(to: "+18445646446") }

  def home
  end
end
