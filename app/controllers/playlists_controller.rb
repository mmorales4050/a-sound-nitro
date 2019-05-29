class PlaylistsController < ApplicationController

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

    playlist_name = params[:name]
    playlist = Playlist.create(name: playlist_name, user_id: 1, image_id: image.id)

    render json: playlist
  end

  def index
    user = User.find(1)
    render json: playlists_object(user)
  end

  def playlists_object(user)
    user.playlists.map do |playlist|
      {id: playlist.id, image: playlist.image.url, name: playlist.name, songs: playlist.songs.map do |song|
        {name: song.name, artist: song.artist, duration: song.duration, url: rails_blob_url(song.file), image: song.image.url}
      end
    }
    end
  end

  def update

  end
end
