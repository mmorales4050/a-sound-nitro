class PlaylistsController < ApplicationController

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
