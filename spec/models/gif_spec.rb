# == Schema Information
#
# Table name: gifs
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Gif do
  let(:title) { 'Cute cat' }
  let(:url) { 'http://www.google.com/image.gif'}

  subject { Gif.new(title: title, url: url)}

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :url }
  it { is_expected.to validate_uniqueness_of :url }
  it { is_expected.to validate_presence_of :title }

  context 'when given an improperly formatted URL' do
    let(:url) { 'nota url'}

    it { is_expected.to_not be_valid }
  end
end
