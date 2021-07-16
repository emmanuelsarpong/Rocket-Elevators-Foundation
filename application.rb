require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rocket
  class Application < Rails::Application
    config.assets.precompile << "audio/*"
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    if ENV["SLACK_API_TOKEN"] then
      Slack.configure do |config|
        config.token = ENV["SLACK_API_TOKEN"]
        $SlackClient = Slack::Web::Client.new
      end
    end

  #   SLACK_NOTIFIER = Slack::Notifier.new (
  #     "https://hooks.slack.com/services/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",
  #     channel: "#api-weeks-team-nicolas"
  # )


    # require 'slack-notifier'

    # notifier = Slack::Notifier.new "WEBHOOK_URL"
    # notifier.ping "Hello World"
    
    # notifier.ping "Hello default"
    # => will message "Hello default"
    # => to the "#default" channel as 'notifier'
    

    require 'zendesk_api'
    require 'oauth2'
    if ENV["ZENDESK_URL"] then
      $zenclient = ZendeskAPI::Client.new do |config|
        config.url = ENV["ZENDESK_URL"]
        config.retry = true

        config.logger = true
        config.username = ENV["ZENDESK_EMAIL"]

        config.token = ENV["ZENDESK_TOKEN"]
        config.access_token = ENV["ZENDESK_AUTH_TOKEN"]
      end
    else
      puts "##########################"
      puts "not using zendesk"
      puts ENV["ZENDESK_URL"].to_s
      puts "##########################"
    end
  end
end
