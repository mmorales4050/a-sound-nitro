class PlaylistSongsController < ApplicationController

  def create
    PlaylistSong.create(song_id: params[:songId], playlist_id: params[:playlistId])
    playlist = Playlist.all.find(params[:playlistId])
    render json: {id: playlist.id, name: playlist.name, songs: playlist.songs.map do |song|
      {name: song.name, artist: song.artist, url: rails_blob_url(song.file)}
    end
  }

  end

  def index
    render json: PlaylistSong.all
  end

  def show
  end
end
