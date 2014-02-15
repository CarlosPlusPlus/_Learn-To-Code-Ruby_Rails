# Object Oriented Jukebox
# => Command Line Interface

##################
# DEFINE CLASSES #
##################

class Song
  attr_accessor :artist, :name

  def initialize (artist, name)
    @artist = artist
    @name   = name
  end

  def to_s
    "'#{@name}' by #{@artist}"
  end
end

class Jukebox
  attr_accessor :songs, :command

  # Constructor and initialization methods.

  def initialize(songs)
    @command = ""
    @power = true
    @songs = []

    songs.each do |song|
      info = song.split(" - ")
      self.songs << Song.new(info.first,info.last)
    end
  end

  def on?
    @power == true
  end

  # Helper methods used to process commands.

  def list
    puts "\nHere is a list of all current songs in the Jukebox:\n\n"
    @songs.each_with_index {|song, index| puts "#{index + 1}. #{song}"}
  end

  def play
    choice = select_song
    play_song(choice)
  end

  def select_song
    puts "\nWhich song would you like to play? Enter integer value.\n"
    choice = gets.chomp.to_i
    choice
  end

  def play_song (choice)
    if (choice > 0) && (choice <= @songs.length)
      puts "\nNow playing #{songs[choice-1]}.\n"
    else
      puts "\nInvalid song choice - try again."
    end
  end

  def help
    puts "\nCommand Line Interface (CLI) Jukebox".upcase
    puts "\nEnter one of the following commands:\n\n"
    puts "list - List all songs."
    puts "play - Choose a song to play."
    puts "help - Jukebox help."
    puts "exit - Exit jukebox\n"
  end

  def exit
    puts "\nThank you for using this Jukebox - have a nice day!\n\n"
    @power = false
  end

  # Primary method for processing command.

  def process_command(cmd)
    case cmd
    when "list"
      list
    when "play"
      play
    when "help"
      help
    when "exit"
      exit
    end
  end

  def operate
    puts "\n"
    print "<3 - "

    @command = gets.downcase.strip

    if [:list, :play, :help, :exit].include?(@command.to_sym)
      self.process_command(@command)
    else
      puts "\nInvalid command - type in 'help' if you need assistance.\n"
    end
  end
end

################
# MAIN PROGRAM #
################

# Define variables for use in main program.

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

while myJukebox.on?
  myJukebox.operate
end