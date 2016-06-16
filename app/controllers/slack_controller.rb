class SlackController < ApplicationController
  include SlackResponses

  # Slack sends a POST with the format with a content-type header set as
  #    application/x-www-form-urlencoded
  # {
  #    token=gIkuvaNzQIHg97ATvDxqgjtO
  #    team_id=T0001
  #    team_domain=example
  #    channel_id=C2147483705
  #    channel_name=test
  #    user_id=U2147483697
  #    user_name=Steve
  #    command=/weather
  #    text=94070
  #    response_url=https://hooks.slack.com/commands/1234/5678
  # }
  def create
    gifs = Gif.joins(:tags).where(tags: {name: command_tags})
    render json: ephemeral_response("hello world!")
  end

  private

  def command_tags
    @command_text ||= params.require(:text).split
  end
end
