class Song < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :length
  validates_presence_of :play_count
  validates_presence_of :artist_id

  belongs_to :artist

  def self.song_count
    Song.all.size
  end
end
