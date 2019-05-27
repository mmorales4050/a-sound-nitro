class PlaylistsController < ApplicationController

  def create
    playlist_name = params[:name]
    playlist = Playlist.create(name: playlist_name, user_id: 1)
    render json: playlist
  end

  def index
    user = User.find(1)
    render json: playlists_object(user)
  end

  def playlists_object(user)
    user.playlists.map do |playlist|
      {id: playlist.id, name: playlist.name, songs: playlist.songs.map do |song|
        {name: song.name, artist: song.artist, duration: song.duration, url: rails_blob_url(song.file)}
      end
    }
    end
  end

  def update

  end
end
