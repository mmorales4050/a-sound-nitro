class PlaylistsController < ApplicationController
  # has_many :songs
  # has_many :songs, through: :playlist_songs

  def create
    playlist_name = params[:name]
    Playlist.create(name: playlist_name, user_id: 1)
  end

  def index
    render json: Playlist.all
  end

  def update

  end
end
