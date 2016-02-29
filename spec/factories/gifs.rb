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

FactoryGirl.define do
  factory :gif do
    title Faker::Hipster.sentence
    url Faker::Internet.url
  end
end
