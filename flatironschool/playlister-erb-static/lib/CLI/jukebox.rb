require_relative "lib/models/artist"
require_relative "lib/models/song"
require_relative "lib/models/genre"
require_relative "lib/models/parse"

class Jukebox

  attr_accessor :command

    Artist.reset_artists
    Genre.reset_genres
    Song.reset_songs

    def initialize
      Parse.new.parse
      self.greeting
      self.ask_for_input
    end

    def greeting
      puts "Welcome to THE JUKEBOX OF THE MOTHER FUCKIN FUTURE"
    end

    def ask_for_input
      puts "Browse by artist or genre:"
      @command = gets.strip
      self.send(@command.downcase.split.first.to_sym)
    end

    def artist
      puts "Artist Total: #{Artist.count}"
      Artist.all.each_with_index do |artist, int|
        puts "#{int+1}. #{artist.name} - #{artist.songs_count}"
      end
      self.choose_an_artist
    end

    def choose_an_artist
      puts "Choose an artist's number to see song list:"
      input = gets.strip.to_i
      puts "#{Artist.all[input-1].name}: "
      Artist.all[input-1].songs.each_with_index do |song, int|
        puts "#{int+1}. #{song.name} - #{song.genre.name}"
      end
      ask_for_input
    end 

    def genre
      sorted_genres.each_with_index do |genre, int|
        puts "#{int+1}. #{genre.name} - #{genre.songs.count} songs, #{genre.artists.count} artists"
      end
      self.choose_a_genre
    end

    def sorted_genres
      Genre.all.sort_by{|genre| genre.songs.count}.reverse
    end

    def choose_a_genre
      puts "Choose a genre's number to see a song list:"
      input = gets.strip.to_i
      puts "#{Genre.all[input-1].name}: "
      Genre.all[input-1].songs.each_with_index do |song, int|
        puts "#{int+1}. #{song.artist.name} - #{song.name}"
      end
      ask_for_input
    end

end

Jukebox.new














