require 'active_support/concern'

module SlackResponses
  extend ActiveSupport::Concern
  included do
    def ephemeral_response(message)
      {
        "response_type" => "ephemeral",
        "text" => message
      }
    end

    def in_channel_response(message)
      {
        "response_type" => "in_channel",
        "text" => message
      }
    end
  end
end
