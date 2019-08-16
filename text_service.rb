# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'dotenv/load' if ENV['RAILS_ENV'] != 'production'

class TextService
  attr_accessor :message

  def initialize(message)
    @message = message
  end

  def self.send(message)
    new(message).send
  end

  def send
    client.messages.create(
      from: from_phone,
      to: to_phone,
      body: message
    )
  end

  private

  def client
    @client ||= Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def from_phone
    @from_phone ||= ENV['TWILIO_PHONE_NUMBER']
  end

  def to_phone
    @to_phone ||= ENV['TO_PHONE_NUMBER']
  end
end