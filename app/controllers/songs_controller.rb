class SongsController < ApplicationController
  # has_many :playlists
  # has_many :playlists, through: :playlist_songs

  def create
    song_number = (params.keys.length - 2)/3

    song_number.times { |index|
      song = Song.create(name: params[("title" + index.to_s).to_sym], artist: params[("artist" + index.to_s).to_sym]).file.attach(params[("file" + index.to_s).to_sym])
    }
  end

  def show
    song = Song.find_by(id: params[:id])

    if song.file.attached?
      render json: {id: song.id, song: song, audio: rails_blob_url(song.file)}
    end
  end

  def song_object
    Song.all.map do |song|
      {id: song.id, name: song.name, artist: song.artist, url: rails_blob_url(song.file)}
    end
  end

  def index
    render json: song_object
  end

end
