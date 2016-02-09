require 'rails_helper'

RSpec.describe Tag do
  let(:name) { "Awesome" }

  subject { Tag.new(name: name) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
  it { is_expected.to have_many(:gifs).through(:taggings) }
end
