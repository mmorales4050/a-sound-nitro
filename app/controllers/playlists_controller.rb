class PlaylistsController < ApplicationController

  def create
    playlist_name = params[:name]
    Playlist.create(name: playlist_name, user_id: 1)
  end

  def index
    user = User.find(1)
    render json: playlists_object(user)
  end

  def playlists_object(user)
    user.playlists.map do |playlist|
      {name: playlist.name, songs: playlist.songs}
    end
  end

  def update

  end
end
