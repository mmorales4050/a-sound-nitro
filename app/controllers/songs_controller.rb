class SongsController < ApplicationController
  # has_many :playlists
  # has_many :playlists, through: :playlist_songs

  def create
    songs = []
    song_number = (params.keys.length - 2)/3

    song_number.times { |index|
      song = Song.create(name: params[("title" + index.to_s).to_sym], artist: params[("artist" + index.to_s).to_sym], index: params[("index" + index.to_s).to_sym])

      song.file.attach(params[("file" + index.to_s).to_sym])

      song_copy = {id: song.id, name: song.name, artist: song.artist, url: rails_blob_url(song.file), index: song.index}

      songs.push(song_copy)
    }
    render json: songs
  end

  def show
    song = Song.find_by(id: params[:id])

    if song.file.attached?
      render json: {id: song.id, song: song, audio: rails_blob_url(song.file)}
    end
  end

  def song_object
    songs = []
    Song.all.each do |song|
      if song.file.attached?
        songs << {id: song.id, index: song.index, name: song.name, artist: song.artist, url: rails_blob_url(song.file)}
      end
    end
    songs
  end

  def index
    render json: song_object
  end

end
