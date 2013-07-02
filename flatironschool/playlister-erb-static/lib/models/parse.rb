class Parse  
  
  def parse
    
    files = Dir.entries("data")
    files.shift
    files.shift

    files.each do |song_file|

      artist = song_file.split(" - ")[0].split("/").first.strip
      song = song_file.split(" - ")[1].split("[").first.strip
      genre = song_file.split(" - ")[1].split("[").last.split("]").first.strip

      new_artist = Artist.find_by_name(artist) || Artist.new
      new_artist.name = artist

      new_song = Song.new
      new_song.name = song

      new_genre = Genre.find_by_name(genre) || Genre.new
      new_genre.name = genre

      new_artist.add_song(new_song)
      new_song.genre = new_genre
      new_genre.artists << new_artist

    end
  end

end