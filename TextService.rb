# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'dotenv/load'

CLIENT = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

FROM = ENV['TWILIO_PHONE_NUMBER'] # Your Twilio number
TO = ENV['TO_PHONE_NUMBER'] # Your mobile phone number

class TextService
  def self.send(message)
    CLIENT.messages.create(
      from: FROM,
      to: TO,
      body: message
    )
  end
end