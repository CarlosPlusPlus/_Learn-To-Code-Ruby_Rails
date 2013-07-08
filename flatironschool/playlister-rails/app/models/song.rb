# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer
#  genre_id   :integer
#

class Song < ActiveRecord::Base
  attr_accessible :name, :artist_id, :genre_id

  belongs_to :artist
  belongs_to :genre

  def youtube
    YoutubeSearch.search("#{self.artist.name} #{self.name}").first
  end

end
