class SongsController < ApplicationController

  def create
    song = Song.create(song_params)
    song.file.attach(song_params[:file])
  end

  def show
    song = Song.find_by(id: params[:id])

    if song.file.attached?
      render json: {song: song, audio: rails_blob_url(song.file)}
    end
  end

  def index
    Song.all.each do |song|
      render json: {song: song, audio: rails_blob_url(song.file)}
    end
  end


  private

  def song_params
    params.permit(:name, :artist, :file)
  end
end
