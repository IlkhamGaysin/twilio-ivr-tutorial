class TwilioIvrsController < ApplicationController
  WELCOME_MESSAGE = %Q{
    Hello, thank you for your calling.
  }.freeze

  VOICE = 'alice'.freeze
  LANGUAGE = 'en-GB'.freeze

  skip_before_action :verify_authenticity_token
  respond_to :text

  def welcome
    response = Twilio::TwiML::Response.new do |r|
      r.Say WELCOME_MESSAGE
      r.Play 'http://demo.twilio.com/hellomonkey/monkey.mp3', voice: VOICE, language: LANGUAGE
      r.Gather numDigits: '1', action: menu_url , method: :get, timeout: 3 do |g|
        g.Say %Q{
          If you want to hear
          random names of any heouros of Game of Thrones,
          please choose 1},
          voice: VOICE, language: LANGUAGE
        g.Say %Q{
          If you want to hear
          random names of any heouros of Harry Potter,
          please choose 2},
          voice: VOICE, language: LANGUAGE
      end
    end

    render text: response.text
  end

  def menu
    choosen_option = params[:Digits].to_i

    case choosen_option
    when 1
      twiml_say(Faker::GameOfThrones.character)
    when 2
      twiml_say(Faker::HarryPotter.character)
    else
      redirect_to welcome_path
    end
  end

  private

  def twiml_say(phrase)
    response = Twilio::TwiML::Response.new do |r|
      r.Say phrase, voice: VOICE, language: LANGUAGE
    end

    render text: response.text
  end
end
