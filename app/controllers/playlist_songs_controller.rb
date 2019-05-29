class PlaylistSongsController < ApplicationController

  def create
    PlaylistSong.create(song_id: params[:songId], playlist_id: params[:playlistId])
    playlist = Playlist.all.find(params[:playlistId])
    render json: {image: playlist.image.url, id: playlist.id, name: playlist.name, songs: playlist.songs.map do |song|
      {id: song.id, name: song.name, artist: song.artist, url: rails_blob_url(song.file), duration: song.duration, image: song.image.url}
    end
  }
  end

  def index
    render json: PlaylistSong.all
  end

  def show
  end
end
