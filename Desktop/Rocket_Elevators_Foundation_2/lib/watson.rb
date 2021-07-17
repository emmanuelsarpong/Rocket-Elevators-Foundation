# require 'rails_admin/config/actions'
# require 'rails_admin/config/actions/base'

require "ibm_watson"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

module RailsAdmin
  module Config
    module Actions
      class Watson < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :root? do
          true
        end

        register_instance_option :breadcrumb_parent do
          nil
        end

        # register_instance_option :controller do
        #   proc do
  #
  #           # #You can specify instance variables
  #           # @custom_stats = "grab your stats here."
  #           #
  #           # #You can access submitted params (just submit your form to the dashboard).
  #           # if params[:xyz]
  #           #   @do_something = "here"
  #           # end
  #           #
  #           # #You can specify flash messages
  #           # #flash.now[:danger] = "Some type of danger message here."
  #           #
  #           # #After you're done processing everything, render the new dashboard
  #           # render @action.template_name, status: 200
  #         end
  #       end

        register_instance_option :route_fragment do
          'watson.html.erb'
        end

        register_instance_option :link_icon do
          'icon-play'
        end

        register_instance_option :statistics? do
          true
        end

      end
    end
  end
end