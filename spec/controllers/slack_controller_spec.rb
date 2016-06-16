require 'rails_helper'

RSpec.describe SlackController do
  describe '#create' do
    let(:json_response) { JSON.parse(response.body) }
    let(:command_tags) { %w(foo bar) }
    let(:slack_command_params) do
      {
        token: 'gIkuvaNzQIHg97ATvDxqgjtO',
        team_id: 'T0001',
        team_domain: 'example',
        channel_id: 'C2147483705',
        channel_name: 'test',
        user_id: 'U2147483697',
        user_name: 'Steve',
        command: '/weather',
        text: command_tags.join(' '),
        response_url: 'https://hooks.slack.com/commands/1234/5678'
      }
    end

    subject(:post_create) { post :create, params: slack_command_params }

    it { is_expected.to have_http_status :ok }

    context "when there is no gif with the given tags" do
      before do
        allow(Gif).to receive(:tagged_with).with(command_tags).and_return([])
      end

      it 'gives an ephemeral response about the failure' do
        post_create
        expect(json_response['response_type']).to eq 'ephemeral'
      end
    end
  end
end
