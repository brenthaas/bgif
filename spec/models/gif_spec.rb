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
  it { is_expected.to validate_presence_of :url }
  it { is_expected.to validate_presence_of :title }
end
