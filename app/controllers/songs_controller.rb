class SongsController < ApplicationController
  # has_many :playlists
  # has_many :playlists, through: :playlist_songs

  def create
    image = nil
    while image == nil
      index = rand(Image.all.length - 1)
      if Image.all[index].song == nil && Image.all[index].playlist == nil
        image = Image.all[index]
      elsif Image.all[index].song.user.id != 0 && Image.all[index].playlist.user.id != 0
           image = Image.all[index]
      end
    end

    song = Song.new name: params[:title], artist: params[:artist], index: params[:index], user_id: 0, image_id: image.id

    song.file.attach params[:file]

    song.save

    song_copy = {id: song.id, index: song.index, name: song.name, artist: song.artist, duration: song.duration, url: rails_blob_url(song.file), image: song.image.url}

    render json: song_copy
    # songs = []
    # song_number = (params.keys.length - 2)/3
    #
    # song_number.times { |index|
    #   song = Song.create(name: params[("title" + index.to_s).to_sym], artist: params[("artist" + index.to_s).to_sym], index: params[("index" + index.to_s).to_sym])
    #
    #   song.file.attach(params[("file" + index.to_s).to_sym])
    #
    #   song_copy = {id: song.id, url: rails_blob_url(song.file)}
    #
    #   songs = songs.push(song_copy)
    #   byebug
    # }
    # render json: songs
  end

  def destroy
    song = Song.find_by(id: params[:id])
    playlist_song_ids = []
    PlaylistSong.all.each do |item|
      if item.song_id == params[:id].to_i
        playlist_song_ids << item.playlist_id
        item.destroy
      end
    end
    song.destroy
    render json: playlist_song_ids
  end

  def update
    # Used to add duration of song after creation
    song = Song.find_by(id: params[:id])
    song.update(duration: params[:duration])
    render json: {id: song.id, index: song.index, name: song.name, artist: song.artist, duration: song.duration, url: rails_blob_url(song.file), image: song.image.url}
  end

  def song_object
    songs = []
    Song.all.each do |song|
      if song.file.attached?
        songs << {id: song.id, index: song.index, name: song.name, artist: song.artist, duration: song.duration, url: rails_blob_url(song.file), image: song.image.url}
      end
    end
    songs
  end

  def index
    render json: song_object
  end

end
