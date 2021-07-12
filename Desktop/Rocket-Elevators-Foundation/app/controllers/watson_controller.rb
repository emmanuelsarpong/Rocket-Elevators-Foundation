class WatsonController < ApplicationController
  require "ibm_watson"
  require "ibm_watson/text_to_speech_v1"
  include IBMWatson

  def refreshaudio
    ################## IBM WATSON ##################
    authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
      apikey: ENV['TEXT_TO_SPEECH_APIKEY'],
    )

    text_to_speech = IBMWatson::TextToSpeechV1.new(
      authenticator: authenticator
    )

    text_to_speech.service_url = ENV['TEXT_TO_SPEECH_URL'] #/v1/workspaces/{workspace_id}/message

    #<% if current_user.present? %>
    #@employee = Employee.new
    #@user = User.find(user_id)
    #user = employee.FirstName
    user = Employee.where(user_id: current_user.id).first
    # greeting = "Greetings #{@employee.FirstName}.
    # greeting = "Greetings #{current_user.FirstName}.
    greeting = "Greetings #{user.FirstName} #{user.LastName}. There are currently #{Elevator.count} elevators deployed in #{Building.count} buildings of your #{Customer.count} customers. Currently, #{Elevator.where.not(:Status => "on").count} elevators are not in Running Status and are being serviced. You currently have #{Quote.count} quotes awaiting processing. You currently have #{Lead.count} leads in your contact requests. #{Battery.count} are deployed across #{Address.distinct.count(:City)} cities."
    # greeting = rand(2..50).to_s

    #puts JSON.pretty_generate(text_to_speech.list_voices.result)
    # File.open("app/assets/audio/watson.mp3", "wb") do |audio_file|
    response = text_to_speech.synthesize(
      text: greeting,
      accept: "audio/mp3",
      voice: "en-GB_JamesV3Voice"
    ).result
    # audio_file << response
    # audio_file.write(response)
    send_data response
    # end

    ################## IBM WATSON ##################
  end

end
