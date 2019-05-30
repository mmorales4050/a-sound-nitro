class PlaylistSongsController < ApplicationController

  def create
    PlaylistSong.create(song_id: params[:songId], playlist_id: params[:playlistId])
    playlist = Playlist.all.find(params[:playlistId])
    render json: playlist_object(playlist)
  end

  def playlist_object(playlist)
    {id: playlist.id, image: playlist.image.url, name: playlist.name, songs: playlist.songs.map do |song|
      {index: song.index, id: song.id, name: song.name, artist: song.artist, duration: song.duration, url: rails_blob_url(song.file), image: song.image.url, playlistSongId: PlaylistSong.all.find_by(playlist_id: playlist.id, song_id: song.id).id}
    end
    }
  end

  def destroy
    playlist_song = PlaylistSong.find_by(id: params[:id])
    playlist_song.destroy
  end

  def index
    render json: PlaylistSong.all
  end

  def show
  end
end
