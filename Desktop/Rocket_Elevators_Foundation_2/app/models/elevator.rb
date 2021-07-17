require 'twilio-ruby'
require 'sinatra'

class Elevator < ApplicationRecord
    belongs_to :column, optional: true

    before_update :updated_elevator
    after_update :send_sms

    def updated_elevator
        if $rocketseeding then
            return
        end
        if $SlackClient and self.Status_changed? then
            text = "The Elevator #{self.id} with Serial Number #{self.SerialNumber} changed status to #{self.Status == "Intervention"}"
            $SlackClient.chat_postMessage(channel: '#elevator_operations', text: text, as_user: true)
        end
    end


    def send_sms()
        if (self.saved_change_to_Status? && self.Status == "Intervention") && (ENV['TWILIO_ACCOUNT_SID'] && ENV['TWILIO_AUTH_TOKEN'] && ENV['TWILIO_ACCOUNT_PHONENUMBER'] && ENV['TWILIO_TARGET_PHONENUMBER'])
            
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
