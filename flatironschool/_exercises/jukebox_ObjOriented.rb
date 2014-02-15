# Object Oriented Jukebox
# => Command Line Interface

##################
# DEFINE CLASSES #
##################

class Song
  attr_reader :artist, :name

  def initialize (artist, name)
    @artist = artist
    @name   = name
  end

  def to_s
    "'#{name}' by #{artist}"
  end
end

class Jukebox
  attr_reader :power, :songs

  VALID_COMMANDS = [:list, :play, :help, :exit]

  def initialize(song_list)
    @power = true
    @songs = []

    parse_songs(song_list)
  end

  def on?
    power == true
  end

  def help
    puts "\nCommand Line Interface (CLI) Jukebox".upcase
    puts "\nEnter one of the following commands:\n\n"
    puts "list # => List all songs."
    puts "play # => Choose a song to play."
    puts "help # => Jukebox help."
    puts "exit # => Exit Jukebox.\n"
  end

  def operate
    print "\n<3 - "

    command = gets.downcase.strip.to_sym
    VALID_COMMANDS.include?(command) ? send(command) : print_error_message
  end

  private

  # Methods used to process commands.
  def list
    puts "\nHere is a list of all current songs in the Jukebox:\n\n"
    @songs.each_with_index { |song, index| puts "#{index + 1}. #{song}" }
  end

  def select_song
    puts "\nWhich song would you like to play? Enter integer value.\n"

    while choice = gets.chomp.to_i
      return choice if choice.between?(1, songs.length)
      puts "\nInvalid song choice - try again."
    end
  end

  def play_song (choice)
    puts "\nNow playing #{songs[choice-1]}.\n"
  end

  def play
    list
    choice = select_song
    play_song(choice)
  end

  def exit
    puts "\nThank you for using this Jukebox - have a nice day!\n\n"
    @power = false
  end

  # Helper methods for initialization and printing.
  def parse_songs(song_list)
    song_list.each do |song|
      info = song.split(" - ")
      songs << Song.new(info.first, info.last)
    end
  end

  def print_error_message
    puts "\nInvalid command - type in 'help' if you need assistance.\n"
  end
end

################
# MAIN PROGRAM #
################

songs = [
  "The Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "The Phoenix - Consolation Prizes"
]

myJukebox = Jukebox.new(songs)
myJukebox.help

while myJukebox.on?
  myJukebox.operate
end