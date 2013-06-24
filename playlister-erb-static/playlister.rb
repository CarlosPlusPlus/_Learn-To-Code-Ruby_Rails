require 'erb'
require_relative "lib/models/init_genres"
require_relative "lib/models/init_songs"
require_relative "lib/models/init_artist"
require_relative "lib/models/genre"
require_relative "lib/models/song"
require_relative "lib/models/artist"
require_relative "lib/models/parse"

class Playlister

  Artist.reset_artists
  Genre.reset_genres
  Song.reset_songs

  def initialize
    Parse.new.parse
  end

  def get_binding
    binding
  end

end

playlist = Playlister.new

# Generate index.html #

template = ERB.new(File.read("./lib/views/index.erb"))
html_content = template.result(playlist.get_binding)
File.open("./static/index.html", "w") do |file|
  file.puts html_content
end

# Generate all artists #

template = ERB.new(File.read("./lib/views/artists.erb"))

Artist.all.each do |artist|
  init_artist = InitArtist.new(artist)
  html_content = template.result(init_artist.get_binding)
  f = File.new("./static/artists/#{artist.name.downcase}.html", "w")
  File.open(f, "w") do |file|
    file.puts html_content
  end
end

# Generate all songs #

template = ERB.new(File.read("lib/views/songs.erb"))

Song.all.each do |song|
  init_songs = InitSongs.new(song)
  html_content = template.result(init_songs.get_binding)
  f = File.new("./static/songs/#{song.name.downcase}.html", "w")
  File.open(f, "w") do |file|
    file.puts html_content
  end
end

# Generate all genres #

template = ERB.new(File.read("lib/views/genres.erb"))

Genre.all.each do |genre|
  init_genres = InitGenres.new(genre)
  html_content = template.result(init_genres.get_binding)
  f = File.new("./static/genres/#{genre.name.downcase}.html", "w")
  File.open(f, "w") do |file|
    file.puts html_content
  end
end