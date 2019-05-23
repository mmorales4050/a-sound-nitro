class PlaylistSongsController < ApplicationController

  def create
    PlaylistSong.create(song_id: params[:songId], playlist_id: params[:playlistId])
  end

  def index
    render json: PlaylistSong.all
  end

  def show
  end
end
