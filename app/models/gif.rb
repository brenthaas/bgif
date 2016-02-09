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

class Gif < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings

  validates :url, presence: true, uniqueness: true, format: URI::regexp(%w(http https))
  validates :title, presence: true
end
