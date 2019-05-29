class Song < ApplicationRecord
  belongs_to :image
  has_one_attached :file
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  attr_accessor :url
end
