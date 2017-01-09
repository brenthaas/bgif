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
  acts_as_taggable
  acts_as_tagger

  validates :url,
    presence: true,
    uniqueness: true,
    format: URI::regexp(%w(http https)),
    length: { maximum: 256 }
    
  validates :title,
    presence: true,
    uniqueness: true,
    length: { minimum: 1, maximum: 256 }


end
