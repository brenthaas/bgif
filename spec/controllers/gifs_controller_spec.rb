require 'rails_helper'

RSpec.describe GifsController do
  describe '#create' do
    subject(:post_create) do
      xhr :post, :create, params: { url: 'http://foo.com/ha.gif'}
    end

    context 'when specifying only a URL' do
      it { is_expected.to have_http_status :created }
    end
  end
end
