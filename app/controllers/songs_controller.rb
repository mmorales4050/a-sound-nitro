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
      render json: {song: song, audio: rails_blob_url(song.file)}
    end
  end

  def index
    songs = []
    Song.all.each do |song|
      songs << {song: song, audio: rails_blob_url(song.file), info: "child"}
    end
    render json: songs
  end

end
