require 'twilio-ruby'
require 'sinatra'

module Messenger
    class SMS
        def send_sms()
            if ENV['TWILIO_ACCOUNT_SID'] && ENV['TWILIO_AUTH_TOKEN'] && ENV['TWILIO_ACCOUNT_PHONENUMBER'] && ENV['TWILIO_TARGET_PHONENUMBER'] then
                
                account_sid = ENV['TWILIO_ACCOUNT_SID']
                auth_token = ENV['TWILIO_AUTH_TOKEN']
                client = Twilio::REST::Client.new(account_sid, auth_token)

                from = ENV['TWILIO_ACCOUNT_PHONENUMBER'] # Your Twilio number
                to = ENV['TWILIO_TARGET_PHONENUMBER']

                client.messages.create(
                    from: from,
                    to: to,
                    body: "The status of elevator #{self.id} with serial number #{self.SerialNumber} has changed to Intervention!"
                )
            end
        end
    end
end

