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

  subject { Gif.new(title: title, url: url) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :url }
  it { is_expected.to validate_uniqueness_of :url }
  it { is_expected.to validate_length_of(:url).is_at_most(256) }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_uniqueness_of :title }
  it { is_expected.to validate_length_of(:title).is_at_most(256) }


  it 'has a valid factory' do
    expect(FactoryGirl.build_stubbed(:gif)).to be_valid
  end

  context 'when given an improperly formatted URL' do
    let(:url) { 'not a url'}

    it { is_expected.to_not be_valid }
  end
end
