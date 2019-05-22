class Song < ApplicationRecord
  has_one_attached :file
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
end
